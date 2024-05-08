
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:template>
    <jsp:attribute name="title">Vehicles</jsp:attribute>

    <jsp:attribute name="header">
        <%@ include file="../navbar/navbar.jsp" %>
        <link href="${pageContext.request.contextPath}/css/home.css" rel="stylesheet" type="text/css">
        <meta
                http-equiv="Content-Security-Policy"
                content="default-src 'self'; img-src https://*; child-src 'none';" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-hiPpX+egM2vZvje4tneImd4zjBKK4p1YFOoq1m3HMK++LX87E6Txu2lYYoJY3UJG" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <h1 class="header1">Buy your dream vehicle here!</h1>
    </jsp:attribute>

    <jsp:attribute name="content">
        <body class="bodycolor">
        <div class="content" id="content">
            <div class="dropdown">
                <button onclick="toggleDropdown()" class="dropbtn">Add vehicle</button>
                <div id="myDropdown" class="dropdown-content">
                    <button type="button" class="addbtnstyle" onclick="filterVehicle('Car')" data-bs-toggle="modal" data-bs-target="#addVehicleModal">Car</button>
                    <button type="button" class="addbtnstyle" onclick="filterVehicle('Boat')" data-bs-toggle="modal" data-bs-target="#addVehicleModal">Boat</button>
                    <button type="button" class="addbtnstyle" onclick="filterVehicle('Plane')" data-bs-toggle="modal" data-bs-target="#addVehicleModal">Plane</button>
                    <button type="button" class="addbtnstyle" onclick="filterVehicle('Tank')" data-bs-toggle="modal" data-bs-target="#addVehicleModal">Tank</button>

                </div>
            </div>

            <div class="container-xl table-responsive">
                <div class="row justify-content-center table-responsive">
                    <div class="col-6">
                        <table class="table table-dark text-center table-responsive">
                            <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Brand</th>
                                <th scope="col">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <s:iterator value="vehicles">
                                        <tr>
                                            <th scope="row"><s:property value="id"/></th>
                                            <td><s:property value="name"/></td>
                                            <td>&#8364; <s:property value="price"/>,-</td>
                                            <td><s:property value="brandName"/></td>
                                            <td>
                                                <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#editModal">Edit</button>
                                                <button class="btn btn-danger"  data-bs-toggle="modal" data-bs-target="#delete">Delete</button>
                                            </td>
                                        </tr>
                                    </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div id="addVehicleModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content vehicle-div-content">
                    <div class="modal-header">
                        <h3 id="vehicleModalTitle" class="modal-title"></h3>
                        <button type="button" id = "closemodal" class="btn-close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="vehicleForm" method="post" action="addVehicle">
                            <div class="col-lg-12 thVehicle">
                                <div class="form-floating mb-3">
                                    <input id="vehicle.name" name="vehicle.name" type="text" class="form-control form-control-lg"
                                           placeholder="Name">
                                    <label for="vehicle.name" class="col-form-label form-label-group">Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="vehicle.brandName" name="vehicle.brandName" type="text" class="form-control form-control-lg"
                                           placeholder="BrandName">
                                    <label for="vehicle.brandName" class="col-form-label form-label-group">Brandname</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="vehicle.price" name="vehicle.price" type="text" class="form-control form-control-lg"
                                           placeholder="Price">
                                    <label for="vehicle.price" class="col-form-label form-label-group">Price</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="vehicle.speed" name="vehicle.speed" type="text" class="form-control form-control-lg"
                                           placeholder="Speed">
                                    <label for="vehicle.speed" class="col-form-label form-label-group">Speed</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="vehicle.seats" name="vehicle.seats" type="text" class="form-control form-control-lg"
                                           placeholder="Seats">
                                    <label for="vehicle.seats" class="col-form-label form-label-group">Seats</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="vehicle.description" name="vehicle.description" type="text" class="form-control form-control-lg"
                                           placeholder="Description">
                                    <label for="vehicle.description" class="col-form-label form-label-group">Description</label>
                                </div>

                                <!-- Subclass form fields.-->
                                <!-- Boat form fields.-->
                                <div id="boat-field" style="display: none;">
                                    <div class="form-floating mb-3">
                                        <input id="boat.amountOfMotors" name="boat.amountOfMotors" type="text" class="form-control form-control-lg"
                                               placeholder="AmountOfMotors">
                                        <label for="boat.amountOfMotors" class="col-form-label form-label-group">amountOfMotors</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input id="boat.navigationGear" name="boat.navigationGear" type="text" class="form-control form-control-lg"
                                               placeholder="NavigationGear">
                                        <label for="boat.navigationGear" class="col-form-label form-label-group">navigationGear</label>
                                    </div>
                                </div>

                                <!-- Car form fields.-->
                                <div id="car-field" style="display: none;">
                                    <div class="form-floating mb-3">
                                        <input id="car.horsePower" name="car.horsePower" type="text" class="form-control form-control-lg"
                                               placeholder="HorsePower">
                                        <label for="car.horsePower" class="col-form-label form-label-group">horsePower</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input id="car.carType" name="car.carType" type="text" class="form-control form-control-lg"
                                               placeholder="CarType">
                                        <label for="car.carType" class="col-form-label form-label-group">carType</label>
                                    </div>
                                </div>

                                <!-- Plane form fields.-->
                                <div id="plane-field" style="display: none;">
                                    <div class="form-floating mb-3">
                                        <input id="plane.maxFlyMin" name="plane.maxFlyMin" type="text" class="form-control form-control-lg"
                                               placeholder="MaxFlyMin">
                                        <label for="plane.maxFlyMin" class="col-form-label form-label-group">maxFlyMin</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input id="plane.maxFlyHeight" name="plane.maxFlyHeight" type="text" class="form-control form-control-lg"
                                               placeholder="MaxFlyHeight">
                                        <label for="plane.maxFlyHeight" class="col-form-label form-label-group">maxFlyHeight</label>
                                    </div>
                                </div>

                                <!-- Tank fields.-->
                                <div id="tank-field" style="display: none;">
                                    <div class="form-floating mb-3">
                                        <input id="tank.armorThickNess" name="tank.armorThickNess" type="text" class="form-control form-control-lg"
                                               placeholder="ArmorThickNess">
                                        <label for="tank.armorThickNess" class="col-form-label form-label-group">armorThickNess</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input id="tank.arsenal" name="tank.arsenal" type="text" class="form-control form-control-lg"
                                               placeholder="Arsenal">
                                        <label for="tank.arsenal" class="col-form-label form-label-group">arsenal</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input id="tank.amountOfPeopleNeeded" name="tank.amountOfPeopleNeeded" type="text" class="form-control form-control-lg"
                                               placeholder="AmountOfPeopleNeeded">
                                        <label for="tank.amountOfPeopleNeeded" class="col-form-label form-label-group">amountOfPeopleNeeded</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input id="tank.arsenalRange" name="tank.arsenalRange" type="text" class="form-control form-control-lg"
                                               placeholder="ArsenalRange">
                                        <label for="tank.arsenalRange" class="col-form-label form-label-group">arsenalRange</label>
                                    </div>
                                </div>
                            </div>
                            <div class="buttonCenter">
                                <input type="submit" class="btn-submit-button" name="voeg-submit" value="Add Vehicle">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>


            function toggleDropdown() {
                document.getElementById("myDropdown").classList.toggle("show");
                console.log("Er is op de dropdown gedrukt.")
            }

            window.onclick = function(event) {
                if (!event.target.matches('.dropbtn')) {
                    var dropdowns = document.getElementsByClassName("dropdown-content");
                    for (var i = 0; i < dropdowns.length; i++) {
                        var openDropdown = dropdowns[i];
                        if (openDropdown.classList.contains('show')) {
                            openDropdown.classList.remove('show');
                        }
                    }
                }
            }
            const carField = document.getElementById('car-field');
            const boatField = document.getElementById('boat-field');
            const tankField = document.getElementById('tank-field');
            const planeField = document.getElementById('plane-field');

            function filterVehicle(type) {
                const modal = document.getElementById('addVehicleModal');
                const modalTitle = document.getElementById('vehicleModalTitle');
                const form = document.getElementById('vehicleForm');

                // Set modal title
                modalTitle.textContent = 'Add a ' + type;

                // Show relevant fields based on vehicle type
                if (type === 'Boat') {
                    boatField.style.display = 'block';
                    planeField.style.display = 'none';
                    tankField.style.display = 'none';
                    carField.style.display = 'none';
                } else if (type === 'Plane') {
                    planeField.style.display = 'block';
                    boatField.style.display = 'none';
                    tankField.style.display = 'none';
                    carField.style.display = 'none';
                } else if (type === 'Tank') {
                    tankField.style.display = 'block';
                    planeField.style.display = 'none';
                    boatField.style.display = 'none';
                    carField.style.display = 'none';
                } else {
                    carField.style.display = 'block';
                    planeField.style.display = 'none';
                    tankField.style.display = 'none';
                    boatField.style.display = 'none';
                }

                // Open modal
                modal.classList.add('show');
                console.log("Modal geopend");
            }
        </script>
        </body>
    </jsp:attribute>
</t:template>
