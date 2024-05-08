package domain;

import jakarta.persistence.*;
import persistence.factories.DAOFactory;

@Entity
@Table(name = "vehicle")
@Inheritance(strategy = InheritanceType.JOINED)
public class Vehicle {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(nullable = false, name = "id")
    private Integer id;

    @Column(nullable = false, name = "name")
    private String name;

    @Column(nullable = false, name = "price")
    private int price;

    @Column(nullable = false, name = "brandName")
    private String brandName;

    @Column(nullable = false, name = "speed")
    private int speed;

    @Column(nullable = false, name = "seats")
    private int seats;

    @Column(name = "description")
    private String description;

    @ManyToOne
    @JoinColumn(name = "dealership_id" )
    private Dealership dealership;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public int getSpeed() {
        return speed;
    }

    public void setSpeed(int speed) {
        this.speed = speed;
    }

    public Dealership getDealership() {
        return dealership;
    }

    public void setDealership(Dealership dealership) {
        this.dealership = dealership;
    }

    public Vehicle() {

    }
    public Vehicle(Integer id, String name, int price, String description , String brandName, int speed, int seats) {

        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.brandName = brandName;
        this.seats = seats;
        this.speed =speed;

    }
    public Vehicle(String name, int price, String description, String brandName , int seats, int speed) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.brandName = brandName;
        this.seats = seats;
        this.speed = speed;
    }

    public void save() {
        DAOFactory.getFactory().getVehicleDAO().persist(this);
    }

    public void update() {
        DAOFactory.getFactory().getVehicleDAO().merge(this);
    }

    @Override
    public String toString() {
        return "Vehicle{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", seats=" + seats +
                ", brandName='" + brandName + '\'' +
                ", speed='" + speed + '\'' +
                ", description='" + description + '\'' +
                '}';
    }

    public String getClassName() {
        return this.getClass().getSimpleName();
    }

}

