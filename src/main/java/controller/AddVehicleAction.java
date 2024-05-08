package controller;

import domain.*;

public class AddVehicleAction {

    private Boat boat;
    private Tank tank;
    private Car car;
    private Plane plane;
    Dealership dealership = DealershipFacade.getInstance().getDealership();

    public String addBoat() {
        boat.setDealership(dealership);
        dealership.addVehicle(boat);
        boat.save();
        System.out.println("Save Boat is uitgevoerd.");
        return "SUCCESS";
    }

    public String addTank() {
        tank.setDealership(dealership);
        dealership.addVehicle(tank);
        tank.save();
        System.out.println("Save Tank word uitgevoerd.");
        return "SUCCESS";
    }

    public String addPlane() {

        plane.setDealership(dealership);
        dealership.addVehicle(plane);
        plane.save();
        System.out.println("Save Plane word uitgevoerd.");
        return "SUCCESS";
    }


    public String addCar() {

        car.setDealership(dealership);
        dealership.addVehicle(car);
        car.save();
        System.out.println("Save Car word uitgevoerd.");
        return "SUCCESS";
    }


    public Tank getTank() {
        return tank;
    }

    public void setTank(Tank tank) {
        this.tank = tank;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }

    public Plane getPlane() {
        return plane;
    }

    public void setPlane(Plane plane) {
        this.plane = plane;
    }

    public void setBoat(Boat boat) {
        this.boat = boat;
    }

    public Boat getBoat() {
        return boat;
    }

    public Dealership getDealership() {
        return dealership;
    }

    public void setDealership(Dealership dealership) {
        this.dealership = dealership;
    }
}