package persistence.dao;


import domain.Tank;
import persistence.interfaces.ITankDAO;

public class TankDAO extends GenericHibernateDAO<Tank, Integer> implements ITankDAO {
}
