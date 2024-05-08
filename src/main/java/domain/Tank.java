package domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import persistence.factories.DAOFactory;

@Entity
public class Tank  extends Vehicle{

    @Column(nullable = false, name = "armorThickNess")
    private int armorThickNess;

    @Column(nullable = false, name = "arsenal")
    private String arsenal;

    @Column(nullable = false, name = "amountOfPeopleNeeded")
    private int amountOfPeopleNeeded;

    @Column(nullable = false, name = "arsenalRange")
    private int arsenalRange;

    public Tank() {

    }


    public int getArmorThickNess() {
        return armorThickNess;
    }

    public void setArmorThickNess(int armorThickNess) {
        this.armorThickNess = armorThickNess;
    }

    public String getArsenal() {
        return arsenal;
    }

    public void setArsenal(String arsenal) {
        this.arsenal = arsenal;
    }

    public int getAmountOfPeopleNeeded() {
        return amountOfPeopleNeeded;
    }

    public void setAmountOfPeopleNeeded(int amountOfPeopleNeeded) {
        this.amountOfPeopleNeeded = amountOfPeopleNeeded;
    }

    public int getRange() {
        return arsenalRange;
    }

    public void setRange(int range) {
        this.arsenalRange = range;
    }

    public Tank(Integer id, String name, int price, String description, String brandName, int speed, int seats, int armorThickNess, String arsenal, int amountOfPeopleNeeded, int arsenalRange) {
        super(id, name, price, description, brandName, speed, seats);
        this.armorThickNess = armorThickNess;
        this.arsenal = arsenal;
        this.amountOfPeopleNeeded = amountOfPeopleNeeded;
        this.arsenalRange = arsenalRange;
    }

    public Tank(String name, int price, String description, String brandName, int seats, int speed, int armorThickNess, String arsenal, int amountOfPeopleNeeded, int arsenalRange) {
        super(name, price, description, brandName, seats, speed);
        this.armorThickNess = armorThickNess;
        this.arsenal = arsenal;
        this.amountOfPeopleNeeded = amountOfPeopleNeeded;

        this.arsenalRange = arsenalRange;
    }

    public void save() {
        DAOFactory.getFactory().getTankDAO().persist(this);
    }
}
