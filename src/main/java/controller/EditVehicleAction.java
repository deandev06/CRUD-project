package controller;

import domain.Boat;
import domain.Car;
import domain.DealershipFacade;
import domain.Plane;

public class EditVehicleAction {

    private Plane plane;
    private Boat boat;
    private Car car;

    public String plane() {
        plane.setDealership(DealershipFacade.getInstance().getDealership());
        plane.update();
        return "success";
    }

    public String boat() {
        boat.setDealership(DealershipFacade.getInstance().getDealership());
        boat.update();
        return "success";
    }

    public String car() {
        car.setDealership(DealershipFacade.getInstance().getDealership());
        car.update();
        return "success";
    }

    public Plane getPlane() {
        return plane;
    }

    public void setPlane(Plane plane) {
        this.plane = plane;
    }

    public Boat getBoat() {
        return boat;
    }

    public void setBoat(Boat boat) {
        this.boat = boat;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }
}