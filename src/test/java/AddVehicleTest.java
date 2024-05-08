import domain.Dealership;
import domain.Vehicle;
import org.junit.Before;
import org.junit.Test;
import persistence.factories.DAOFactories;
import persistence.factories.DAOFactory;

import static org.junit.Assert.assertTrue;

public class AddVehicleTest {

    private Dealership dealership;
    private Vehicle vehicle;

    @Before
    public void setUp() {
        DAOFactory.setFactory(DAOFactories.HIBERNATE.getFactory());
        dealership = new Dealership();
        vehicle = new Vehicle("X163", 12, "Mooie auto", "BMW", 12, 120);
    }

    @Test
    public void addVehicleToDealerShip() {
        dealership.addVehicle(vehicle);
        assertTrue(dealership.getVehicles().contains(vehicle));
    }
}
