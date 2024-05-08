package persistence.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import domain.Vehicle;
import jakarta.persistence.PersistenceException;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.exception.ConstraintViolationException;
import persistence.interfaces.IGenericDAO;

import static persistence.utils.HibernateSessionManager.getSessionFactory;


public abstract class GenericHibernateDAO<T, ID extends Serializable> implements IGenericDAO<T, ID> {

	private Class<T> persistentClass;
	private Session session;

	@SuppressWarnings("unchecked")
	public GenericHibernateDAO() {
		this.persistentClass = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass())
				.getActualTypeArguments()[0];
	}

	public void setSession(Session s) {
		this.session = s;
	}

	protected Session getSession() {
		if (session == null) {
			throw new IllegalStateException("Session has not been set on DAO before usage");
		}
		return session;
	}

	public Class<T> getPersistentClass() {
		return persistentClass;
	}

	@Override
	public T persist(T entity) {
		try {
			getSession().beginTransaction();
			getSession().persist(entity);
			getSession().getTransaction().commit();
			// TODO Do not catch at high level. Catch specific exception
		} catch (PersistenceException e) {
			entity = null;

			if (getSession().getTransaction() != null) {
				getSession().getTransaction().rollback();

			}
			if (e.getCause() instanceof ConstraintViolationException) {
				ConstraintViolationException cve = (ConstraintViolationException) e.getCause();
				System.out.println(cve.getSQLException().getSQLState());
				throw (ConstraintViolationException) e.getCause();

			}

		}
		return entity;
	}

	@Override
	public void remove(T entity) {
		getSession().beginTransaction();
		session.remove(entity);
		getSession().getTransaction().commit();
	}

	@Override
	public void merge(T entity) {
		getSession().beginTransaction();
		getSession().merge(entity);
		getSession().getTransaction().commit();
	}

	@Override
	public T findById(ID id) {
		getSession().beginTransaction();
		T entity = getSession().find(getPersistentClass(), id);
		getSession().getTransaction().commit();
		return entity;

	}


	@Override
	public Set<T> findAll() {
		getSession().beginTransaction();

		CriteriaBuilder builder = getSession().getCriteriaBuilder();

		CriteriaQuery<T> criteria = builder.createQuery(getPersistentClass());
		Root<T> root = criteria.from(getPersistentClass());
		criteria.select(root);

		List<T> list = getSession().createQuery(criteria).getResultList();

		getSession().getTransaction().commit();

		Set<T> set = new HashSet<T>();
		set.addAll(list);

		return set;
	}

	@Override
	public void refresh(Vehicle vehicle) {
		getSession().beginTransaction();
		getSession().refresh(vehicle);
		getSession().getTransaction().commit();
	}

	public void flush() {
		getSession().flush();
	}

	public void clear() {
		getSession().clear();
	}
}