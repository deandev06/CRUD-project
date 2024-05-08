package domain;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import persistence.factories.DAOFactory;

@Entity
public class Plane extends Vehicle{

    @Column(nullable = false, name = "maxFlyMin")
    private int maxFlyMin;

    @Column(nullable = false, name = "maxFlyHeight")
    private long maxFlyHight;

    public Plane() {

    }


    public int getMaxFlyMin() {
        return maxFlyMin;
    }

    public void setMaxFlyRange(int maxFlyMin) {
        this.maxFlyMin = maxFlyMin;
    }

    public long getMaxFlyHight() {
        return maxFlyHight;
    }

    public void setMaxFlyHight(long maxFlyHight) {
        this.maxFlyHight = maxFlyHight;
    }

    public Plane(Integer id, String name, int price, String description, String brandName, int speed, int seats, int maxFlyMin, long maxFlyHight) {
        super(id, name, price, description, brandName, speed, seats);
        this.maxFlyMin = maxFlyMin;
        this.maxFlyHight = maxFlyHight;
    }

    public Plane(String name, int price, String description, String brandName, int seats, int speed, int maxFlyMin, long maxFlyHight) {
        super(name, price, description, brandName, seats, speed);
        this.maxFlyMin = maxFlyMin;
        this.maxFlyHight = maxFlyHight;
    }

    public void save() {
        DAOFactory.getFactory().getPlaneDAO().persist(this);
    }
}
