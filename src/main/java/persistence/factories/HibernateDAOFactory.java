package persistence.factories;

import domain.*;
import org.hibernate.Session;
import persistence.dao.*;

import persistence.interfaces.*;
import persistence.utils.HibernateSessionManager;

public class HibernateDAOFactory extends DAOFactory {

	protected Session getCurrentSession() {
		return HibernateSessionManager.getSessionFactory().getCurrentSession();
	}

	@Override
	public IVehicleDAO getVehicleDAO() {
		GenericHibernateDAO<Vehicle, Integer> dao = null;
		try {
			dao = VehicleDAO.class.getDeclaredConstructor().newInstance();
			Session session = getCurrentSession();
			if (session == null) {
				throw new IllegalStateException("Hibernate session is null");
			}
			dao.setSession(session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (IVehicleDAO) dao;
	}


	@Override
	public IBoatDAO getBoatDAO() {
		GenericHibernateDAO<Boat, Integer> dao = null;
		try {
			dao = BoatDAO.class.getDeclaredConstructor().newInstance();
			dao.setSession(getCurrentSession());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (IBoatDAO) dao;
	}

	@Override
	public IPlaneDAO getPlaneDAO() {
		GenericHibernateDAO<Plane, Integer> dao = null;
		try {
			dao = PlaneDAO.class.getDeclaredConstructor().newInstance();
			dao.setSession(getCurrentSession());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (IPlaneDAO) dao;
	}

	@Override
	public ICarDAO getCarDAO() {
		GenericHibernateDAO<Car, Integer> dao = null;
		try {
			dao = CarDAO.class.getDeclaredConstructor().newInstance();
			dao.setSession(getCurrentSession());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ICarDAO) dao;
	}

	@Override
	public ITankDAO getTankDAO() {
		GenericHibernateDAO<Tank, Integer> dao = null;
		try {
			dao = TankDAO.class.getDeclaredConstructor().newInstance();
			dao.setSession(getCurrentSession());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (ITankDAO) dao;
	}

	@Override
	public IDealershipDAO getDealershipDAO() {
		GenericHibernateDAO<Dealership, Integer> dao = null;
		try {
			dao = DealershipDAO.class.getDeclaredConstructor().newInstance();
			Session session = getCurrentSession();
			if (session == null) {
				throw new IllegalStateException("Hibernate session is null");
			}
			dao.setSession(session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (IDealershipDAO) dao;
	}
}
