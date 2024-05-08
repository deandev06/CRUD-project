package domain;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import persistence.factories.DAOFactory;

@Entity
public class Boat  extends  Vehicle{

    @Column(nullable = false, name = "amountOfMotors")
    private int amountOfMotors;

    @Column(nullable = false, name = "navigationGear")
    private String navigationGear;

    public Boat() {

    }

    public int getAmountOfMotors() {
        return amountOfMotors;
    }

    public void setAmountOfMotors(int amountOfMotors) {
        this.amountOfMotors = amountOfMotors;
    }

    public String getNavigationGear() {
        return navigationGear;
    }

    public void setNavigationGear(String navigationGear) {
        this.navigationGear = navigationGear;
    }

    public Boat(Integer id, String name, int price, String description, String brandName, int speed, int seats, int amountOfMotors, String navigationGear) {
        super(id, name, price, description, brandName, speed, seats);
        this.amountOfMotors = amountOfMotors;
        this.navigationGear = navigationGear;
    }

    public Boat(String name, int price, String description, String brandName, int seats, int speed, int amountOfMotors, String navigationGear) {
        super(name, price, description, brandName, seats, speed);
        this.amountOfMotors = amountOfMotors;
        this.navigationGear = navigationGear;
    }

    public void save() {
        DAOFactory.getFactory().getBoatDAO().persist(this);

    }

}
