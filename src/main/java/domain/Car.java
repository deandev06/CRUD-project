package domain;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import persistence.factories.DAOFactory;

@Entity
public class Car extends Vehicle{

    @Column(nullable = false, name = "horsePower")
    private int horsePower;

    @Column(nullable = false, name = "carType")
    private String carType;

    public Car() {

    }


    public int getHorsePower() {
        return horsePower;
    }

    public void setHorsePower(int horsePower) {
        this.horsePower = horsePower;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public Car(Integer id, String name, int price, String description, String brandName, int speed, int seats, int horsePower, String carType) {
        super(id, name, price, description, brandName, speed, seats);
        this.horsePower = horsePower;
        this.carType = carType;
    }

    public Car(String name, int price, String description, String brandName, int seats, int speed, int horsePower, String carType) {
        super(name, price, description, brandName, seats, speed);
        this.horsePower = horsePower;
        this.carType = carType;
    }


    public void save() {
        DAOFactory.getFactory().getCarDAO().persist(this);
    }

}

