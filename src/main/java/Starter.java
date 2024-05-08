
import domain.Vehicle;
import persistence.factories.DAOFactories;
import persistence.factories.DAOFactory;
import persistence.factories.HibernateDAOFactory;
import persistence.utils.HibernateSessionManager;

import java.util.Set;

public class Starter {

    public static void main(String ... args) {

        DAOFactory.setFactory(DAOFactories.HIBERNATE.getFactory());

        Set<Vehicle> vehicles = Set.of(
                new Vehicle("X163", 12, "Mooie auto", "BMW", 12, 120),
                new Vehicle("X164", 13, "Mooie auto", "BMW", 12, 120),
                new Vehicle("X165", 12, "Mooie auto", "BMW", 12, 120)
        );

        for (Vehicle vehicle : vehicles) {
            HibernateDAOFactory.getFactory().getVehicleDAO().persist(vehicle);
        }
        System.out.println(HibernateDAOFactory.getFactory().getVehicleDAO().findAll());

        HibernateSessionManager.shutdown();

    }

}