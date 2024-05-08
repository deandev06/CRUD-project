package persistence.dao;

import domain.Car;
import persistence.interfaces.ICarDAO;

public class CarDAO extends GenericHibernateDAO<Car, Integer> implements ICarDAO {


}