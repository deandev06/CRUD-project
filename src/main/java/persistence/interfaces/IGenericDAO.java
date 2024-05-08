package persistence.interfaces;

import domain.Vehicle;

import java.io.Serializable;
import java.util.Set;

public interface IGenericDAO<T, ID extends Serializable> {

    T persist(T entity);
    void merge(T entity);
    void remove(T entity);
    T findById(ID id);
    Set<T> findAll();
    void refresh(Vehicle vehicle);

}