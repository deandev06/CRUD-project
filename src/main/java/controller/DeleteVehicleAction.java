package controller;
import domain.Dealership;
import domain.DealershipFacade;


public class DeleteVehicleAction {

        private Integer id;

        public String deleteVehicle() {
            Dealership d = DealershipFacade.getInstance().getDealership();
            d.deleteVehicle(id);
            return "SUCCESS";
        }

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }

    }
