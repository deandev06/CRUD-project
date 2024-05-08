package controller;

import domain.Dealership;
import domain.DealershipFacade;
import domain.Vehicle;
import java.util.Set;

public class HomeAction {

    private Set<Vehicle> vehicles;
    public Set<Vehicle> getVehicles() {
        return vehicles;
    }

    public void setVehicles(Set<Vehicle> vehicles) {
        this.vehicles = vehicles;
    }

    public String execute() {
        Dealership d = DealershipFacade.getInstance().getDealership();
        vehicles =  d.getAllVehicles();

        return "success";
    }
}