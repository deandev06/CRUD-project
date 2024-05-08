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
                content="default-src 'self'; img-src https://*; child-src 'none';"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-hiPpX+egM2vZvje4tneImd4zjBKK4p1YFOoq1m3HMK++LX87E6Txu2lYYoJY3UJG"
                crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <h1 class="header1">Buy your dream vehicle here!</h1>
    </jsp:attribute>

    <jsp:attribute name="content">
        <body class="bodycolor">
        <div class="content" id="content">
            <div class="dropdown">
                <button onclick="toggleDropdown()" class="dropbtn">Add vehicle</button>
                <div id="myDropdown" class="dropdown-content">
                         Add Vehicle Buttons(not dynamic and Working)
                                           <button type="button" class="addbtnstyle" data-bs-toggle="modal" data-bs-target="#addCarModal">Car
                                          </button>
                                           <button type="button" class="addbtnstyle" data-bs-toggle="modal" data-bs-target="#addBoatModal">
                                          Boat
                                            </button>
                                           <button type="button" class="addbtnstyle" data-bs-toggle="modal" data-bs-target="#addPlaneModal">
                                            Plane
                                            </button>

                    <!-- Dynamic Test Buttons -->
                    <button type="button" class="addbtnstyle" onclick="filterVehicle('Boat')" data-bs-toggle="modal"
                            data-bs-target="#addVehicleModal">
                        BoatTest
                    </button>
                    <button type="button" class="addbtnstyle" onclick="filterVehicle('Car')" data-bs-toggle="modal"
                            data-bs-target="#addVehicleModal">
                        CarTest
                    </button>
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

                                                <button class="btn btn-success" data-bs-toggle="modal"
                                                        data-bs-id="<s:property value="id"/>"
                                                        data-bs-name="<s:property value="name"/>"
                                                        data-bs-brandName="<s:property value="brandName"/>"
                                                        data-bs-price="<s:property value="price"/>"
                                                        data-bs-description="<s:property value="description"/>"
                                                        data-bs-amountOfMotors="<s:property value="amountOfMotors"/>"
                                                        data-bs-navigationGear="<s:property value="navigationGear"/>"
                                                        data-bs-seats="<s:property value="seats"/>"
                                                        data-bs-speed="<s:property value="speed"/>"
                                                        data-bs-maxFlyMin="<s:property value="maxFlyMin"/>"
                                                        data-bs-maxFlyHeight="<s:property value="maxFlyHight"/>"
                                                        data-bs-horsePower="<s:property value="horsePower"/>"
                                                        data-bs-carType="<s:property value="carType"/>"
                                                        data-bs-target="#edit<s:property value="getClassName()"/>">
                                                    Edit
                                                </button>
                                                <button class="btn btn-success" data-bs-toggle="modal"
                                                        data-bs-target="#viewBoatModal"
                                                        data-bs-id="<s:property value='id'/>"
                                                        data-bs-name="<s:property value='name'/>"
                                                        data-bs-brandName="<s:property value='brandName'/>"
                                                        data-bs-price="<s:property value='price'/>"
                                                        data-bs-description="<s:property value='description'/>"
                                                        data-bs-amountOfMotors="<s:property value='amountOfMotors'/>"
                                                        data-bs-navigationGear="<s:property value='navigationGear'/>"
                                                        data-bs-maxFlyMin="<s:property value='maxFlyMin'/>"
                                                        data-bs-maxFlyHeight="<s:property value='maxFlyHeight'/>"
                                                        data-bs-seats="<s:property value='seats'/>"
                                                        data-bs-speed="<s:property value='speed'/>">
                                                    <i class="bi bi-eye-fill"></i>
                                                </button>

                                                <form action="deleteVehicle" method="post">
                                                    <input type="hidden" name="id" id="id"
                                                           value="<s:property value="id"/>">
                                                    <button class="btn btn-danger">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                            </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

<%--        <div id="addVehicleModal" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content vehicle-div-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <h3 id="vehicleModalTitle" class="modal-title"></h3>--%>
<%--                        <button type="button" id = "closemodal" class="btn-close"></button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body">--%>
<%--                        <form id="vehicleForm" method="post" action="addVehicle">--%>
<%--                            <div class="col-lg-12 thVehicle">--%>
<%--                                <div class="form-floating mb-3">--%>
<%--                                    <input id="vehicle.name" name="vehicle.name" type="text" class="form-control form-control-lg"--%>
<%--                                           placeholder="Name">--%>
<%--                                    <label for="vehicle.name" class="col-form-label form-label-group">Name</label>--%>
<%--                                </div>--%>
<%--                                <div class="form-floating mb-3">--%>
<%--                                    <input id="vehicle.brandName" name="vehicle.brandName" type="text" class="form-control form-control-lg"--%>
<%--                                           placeholder="BrandName">--%>
<%--                                    <label for="vehicle.brandName" class="col-form-label form-label-group">Brandname</label>--%>
<%--                                </div>--%>
<%--                                <div class="form-floating mb-3">--%>
<%--                                    <input id="vehicle.price" name="vehicle.price" type="text" class="form-control form-control-lg"--%>
<%--                                           placeholder="Price">--%>
<%--                                    <label for="vehicle.price" class="col-form-label form-label-group">Price</label>--%>
<%--                                </div>--%>
<%--                                <div class="form-floating mb-3">--%>
<%--                                    <input id="vehicle.speed" name="vehicle.speed" type="text" class="form-control form-control-lg"--%>
<%--                                           placeholder="Speed">--%>
<%--                                    <label for="vehicle.speed" class="col-form-label form-label-group">Speed</label>--%>
<%--                                </div>--%>
<%--                                <div class="form-floating mb-3">--%>
<%--                                    <input id="vehicle.seats" name="vehicle.seats" type="text" class="form-control form-control-lg"--%>
<%--                                           placeholder="Seats">--%>
<%--                                    <label for="vehicle.seats" class="col-form-label form-label-group">Seats</label>--%>
<%--                                </div>--%>
<%--                                <div class="form-floating mb-3">--%>
<%--                                    <input id="vehicle.description" name="vehicle.description" type="text" class="form-control form-control-lg"--%>
<%--                                           placeholder="Description">--%>
<%--                                    <label for="vehicle.description" class="col-form-label form-label-group">Description</label>--%>
<%--                                </div>--%>

<%--                                <!-- Subclass form fields.-->--%>
<%--                                <!-- Boat form fields.-->--%>
<%--                                <div id="boat-field" style="display: none;">--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="boat.amountOfMotors" name="boat.amountOfMotors" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="AmountOfMotors">--%>
<%--                                        <label for="boat.amountOfMotors" class="col-form-label form-label-group">amountOfMotors</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="boat.navigationGear" name="boat.navigationGear" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="NavigationGear">--%>
<%--                                        <label for="boat.navigationGear" class="col-form-label form-label-group">navigationGear</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <!-- Car form fields.-->--%>
<%--                                <div id="car-field" style="display: none;">--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="car.horsePower" name="car.horsePower" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="HorsePower">--%>
<%--                                        <label for="car.horsePower" class="col-form-label form-label-group">horsePower</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="car.carType" name="car.carType" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="CarType">--%>
<%--                                        <label for="car.carType" class="col-form-label form-label-group">carType</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <!-- Plane form fields.-->--%>
<%--                                <div id="plane-field" style="display: none;">--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="plane.maxFlyMin" name="plane.maxFlyMin" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="MaxFlyMin">--%>
<%--                                        <label for="plane.maxFlyMin" class="col-form-label form-label-group">maxFlyMin</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="plane.maxFlyHeight" name="plane.maxFlyHeight" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="MaxFlyHeight">--%>
<%--                                        <label for="plane.maxFlyHeight" class="col-form-label form-label-group">maxFlyHeight</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <!-- Tank fields.-->--%>
<%--                                <div id="tank-field" style="display: none;">--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="tank.armorThickNess" name="tank.armorThickNess" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="ArmorThickNess">--%>
<%--                                        <label for="tank.armorThickNess" class="col-form-label form-label-group">armorThickNess</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="tank.arsenal" name="tank.arsenal" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="Arsenal">--%>
<%--                                        <label for="tank.arsenal" class="col-form-label form-label-group">arsenal</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="tank.amountOfPeopleNeeded" name="tank.amountOfPeopleNeeded" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="AmountOfPeopleNeeded">--%>
<%--                                        <label for="tank.amountOfPeopleNeeded" class="col-form-label form-label-group">amountOfPeopleNeeded</label>--%>
<%--                                    </div>--%>
<%--                                    <div class="form-floating mb-3">--%>
<%--                                        <input id="tank.arsenalRange" name="tank.arsenalRange" type="text" class="form-control form-control-lg"--%>
<%--                                               placeholder="ArsenalRange">--%>
<%--                                        <label for="tank.arsenalRange" class="col-form-label form-label-group">arsenalRange</label>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="buttonCenter">--%>
<%--                                <input type="submit" class="btn-submit-button" name="voeg-submit" value="Add Vehicle">--%>
<%--                            </div>--%>
<%--                        </form>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <!-- Add Boat Modal-->
        <div class="modal" id   ="addBoatModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content vehicle-div-content">
                    <div class="modal-header"><h3 class="modal-title">Add a Boat</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body ">
                        <form method="post" action="addVehicle">
                            <div class="col-lg-12 thVehicle">
                                <div class="form-floating mb-3">
                                    <input id="Boat.name" name="boat.name" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="BoatName">
                                    <label for="Boat.name" class="col-form-label form-label-group">Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Boat.brand" name="boat.brandName" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="BoatBrand">
                                    <label for="Boat.brand" class="col-form-label form-label-group">Brand Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Boat.seats" name="boat.seats" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="boatSeats">
                                    <label for="Boat.seats" class="col-form-label form-label-group">Amount of
                                        seats </label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Boat.speed" name="boat.speed" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="Boat.speed">
                                    <label for="Boat.speed" class="col-form-label form-label-group">Maximum speed in
                                        KM</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Boat.price" name="boat.price" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="Boat.price">
                                    <label for="Boat.price" class="col-form-label form-label-group">Price</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Boat.amountOfMotors" name="boat.amountOfMotors" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="Boat.amountOfMotors">
                                    <label for="Boat.amountOfMotors" class="col-form-label form-label-group">Amount of
                                        motors</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Boat.navigationGear" name="boat.navigationGear" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Boat.navigationGear">
                                    <label for="Boat.navigationGear" class="col-form-label form-label-group">Navigation
                                        gear</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Boat.description" name="boat.description" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Boat.description">
                                    <label for="Boat.description"
                                           class="col-form-label form-label-group">Description</label>
                                </div>
                            </div>
                            <div class="buttonCenter">
                                <input type="submit" class="btn-submit-button" value="Add Vehicle">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--Add Plane Modal-->
        <div class="modal" id="addPlaneModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content vehicle-div-content">
                    <div class="modal-header"><h3 class="modal-title">Add a Plane</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body ">
                        <form method="post" action="addPlane">
                            <div class="col-lg-12 thVehicle">
                                <div class="form-floating mb-3">
                                    <input id="Plane.name" name="plane.name" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.name">
                                    <label for="Plane.name" class="col-form-label form-label-group">Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Plane.brandName" name="plane.brandName" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.brandName">
                                    <label for="Plane.brandName" class="col-form-label form-label-group">Brand
                                        Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Plane.seats" name="plane.seats" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.seats">
                                    <label for="Plane.seats" class="col-form-label form-label-group">Amount of
                                        seats </label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Plane.speed" name="plane.speed" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.speed">
                                    <label for="Plane.speed" class="col-form-label form-label-group">Maximum speed in
                                        KM</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Plane.price" name="plane.price" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.price">
                                    <label for="Plane.price" class="col-form-label form-label-group">Price</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Plane.maxFlyRange" name="plane.maxFlyRange" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.maxFlyRange">
                                    <label for="Plane.maxFlyRange" class="col-form-label form-label-group">Maximum fly
                                        range</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Plane.maxFlyHight" name="plane.maxFlyHight" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.maxFlyHight">
                                    <label for="Plane.maxFlyHight" class="col-form-label form-label-group">Maximum
                                        height</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input id="Plane.description" name="plane.description" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.description">
                                    <label for="Plane.description"
                                           class="col-form-label form-label-group">Description</label>
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

        <!-- Add Car Modal-->
        <div class="modal" id="addCarModal" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content vehicle-div-content">
                    <div class="modal-header"><h3 class="modal-title">Add a Car</h3>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body ">
                        <form method="post" action="addCar">
                            <div class="col-lg-12 thVehicle">
                                <div class="form-floating mb-3">
                                    <input id="Car.name" name="car.name" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.name">
                                    <label for="Car.name" class="col-form-label form-label-group">Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Car.brandName" name="car.brandName" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Car.brandName">
                                    <label for="Car.brandName" class="col-form-label form-label-group">Brand
                                        Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Car.seats" name="car.seats" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="car.seats">
                                    <label for="car.seats" class="col-form-label form-label-group">Amount of
                                        seats </label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Car.speed" name="car.speed" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.speed">
                                    <label for="Car.speed" class="col-form-label form-label-group">Maximum speed in
                                        KM</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Car.maxFlyRange" name="car.horsePower" type="number"
                                           class="form-control form-control-lg"
                                           placeholder="Car.maxFlyRange">
                                    <label for="Car.maxFlyRange"
                                           class="col-form-label form-label-group">horsePower</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Car.carType" name="car.carType" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Car.carType">
                                    <label for="Car.carType" class="col-form-label form-label-group">CarType</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Car.price" name="car.price" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Car.price">
                                    <label for="Car.price" class="col-form-label form-label-group">Price</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="Car.description" name="Car.description" type="text"
                                           class="form-control form-control-lg"
                                           placeholder="Plane.description">
                                    <label for="Plane.description"
                                           class="col-form-label form-label-group">Description</label>
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

        <!-- View Boat Modal-->
        <div class="modal fade" id="viewBoatModal" tabindex="-1" aria-labelledby="viewBoatModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="viewBoatModalLabel">Boat Information</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="table table-dark table-striped">
                            <tbody>
                            <tr>
                                <td>ID:</td>
                                <td class="view-column" id="viewId"></td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td class="view-column" id="viewName"></td>
                            </tr>
                            <tr>
                                <td>Brand Name:</td>
                                <td class="view-column" id="viewBrandName"></td>
                            </tr>
                            <tr>
                                <td>Price:</td>
                                <td class="view-column" id="viewPrice"></td>
                            </tr>
                            <tr>
                                <td>Amount of Motors:</td>
                                <td class="view-column" id="viewAmountOfMotors"></td>
                            </tr>
                            <tr>
                                <td>Navigation Gear:</td>
                                <td class="view-column" id="viewNavigationGear"></td>
                            </tr>
                            <tr>
                                <td>Seats:</td>
                                <td class="view-column" id="viewSeats"></td>
                            </tr>
                            <tr>
                                <td>Speed:</td>
                                <td class="view-column" id="viewSpeed"></td>
                            </tr>
                            <tr>
                                <td>Description:</td>
                                <td class="view-column" id="viewDescription"></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Car Modal-->
        <div id="editBoat" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content vehicle-div-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Edit Boat Listing</h3>
                        <button type="button" class="btn-close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="editBoat">
                            <input type="hidden" name="boat.id" id="edit-boat-id">
                            <div class="col-lg-12 thVehicle">

                                <div class="form-floating mb-3">
                                    <input id="edit-boat-name" name="boat.name" type="text"
                                           class="form-control form-control-lg" placeholder="Name">
                                    <label for="edit-boat-name" class="col-form-label form-label-group">Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-boat-brandName" name="boat.brandName" type="text"
                                           class="form-control form-control-lg" placeholder="Brand name">
                                    <label for="edit-boat-brandName" class="col-form-label form-label-group">Brand
                                        name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-boat-price" name="boat.price" type="number"
                                           class="form-control form-control-lg" placeholder="Price">
                                    <label for="edit-boat-price" class="col-form-label form-label-group">Price</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-boat-speed" name="boat.speed" type="number"
                                           class="form-control form-control-lg" placeholder="Speed">
                                    <label for="edit-boat-speed" class="col-form-label form-label-group">Speed</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-boat-seats" name="boat.seats" type="number"
                                           class="form-control form-control-lg" placeholder="Seats">
                                    <label for="edit-boat-seats" class="col-form-label form-label-group">Seats</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-boat-motors" name="boat.amountOfMotors" type="number"
                                           class="form-control form-control-lg" placeholder="Amount of motors">
                                    <label for="edit-boat-motors" class="col-form-label form-label-group">Amount of
                                        motors</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-boat-navigation" name="boat.navigationGear" type="text"
                                           class="form-control form-control-lg" placeholder="Navigation gear">
                                    <label for="edit-boat-navigation" class="col-form-label form-label-group">Navigation
                                        gear</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-boat-description" name="boat.description" type="text"
                                           class="form-control form-control-lg" placeholder="Description">
                                    <label for="edit-boat-description" class="col-form-label form-label-group">Description</label>
                                </div>

                            </div>
                            <div class="text-center">
                                <input type="submit" class="btn btn-primary w-100 rounded-4 py-2" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Car Modal-->
        <div id="editCar" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content vehicle-div-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Edit Car Listing</h3>
                        <button type="button" class="btn-close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="editCar">
                            <input type="hidden" name="boat.id" id="edit-car-id">
                            <div class="col-lg-12 thVehicle">

                                <div class="form-floating mb-3">
                                    <input id="edit-car-name" name="car.name" type="text"
                                           class="form-control form-control-lg" placeholder="Name">
                                    <label for="edit-car-name" class="col-form-label form-label-group">Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-car-brandName" name="car.brandName" type="text"
                                           class="form-control form-control-lg" placeholder="Brand name">
                                    <label for="edit-car-brandName" class="col-form-label form-label-group">Brand
                                        name</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input id="edit-car-price" name="car.price" type="number"
                                           class="form-control form-control-lg" placeholder="Price">
                                    <label for="edit-car-price" class="col-form-label form-label-group">Price</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-car-speed" name="car.speed" type="number"
                                           class="form-control form-control-lg" placeholder="Speed">
                                    <label for="edit-car-speed" class="col-form-label form-label-group">Speed</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-car-seats" name="car.seats" type="number"
                                           class="form-control form-control-lg" placeholder="Seats">
                                    <label for="edit-car-seats" class="col-form-label form-label-group">Seats</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-car-horsepower" name="car.horsePower" type="number"
                                           class="form-control form-control-lg" placeholder="Amount of motors">
                                    <label for="edit-car-horsepower" class="col-form-label form-label-group">horsepower
                                    </label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-car-cartype" name="car.carType" type="text"
                                           class="form-control form-control-lg" placeholder="Navigation gear">
                                    <label for="edit-car-cartype" class="col-form-label form-label-group">type of car
                                    </label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-car-description" name="car.description" type="text"
                                           class="form-control form-control-lg" placeholder="Description">
                                    <label for="edit-car-description" class="col-form-label form-label-group">Description</label>
                                </div>

                            </div>
                            <div class="text-center">
                                <input type="submit" class="btn btn-primary w-100 rounded-4 py-2" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Plane Modal-->
        <div id="editPlane" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content vehicle-div-content">
                    <div class="modal-header">
                        <h3 class="modal-title">Edit Plane Listing</h3>
                        <button type="button" class="btn-close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="editPlane">
                            <input type="hidden" name="plane.id" id="edit-plane-id">
                            <div class="col-lg-12 thVehicle">

                                <div class="form-floating mb-3">
                                    <input id="edit-plane-name" name="plane.name" type="text"
                                           class="form-control form-control-lg" placeholder="Name">
                                    <label for="edit-plane-name" class="col-form-label form-label-group">Name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-plane-brandName" name="plane.brandName" type="text"
                                           class="form-control form-control-lg" placeholder="Brand name">
                                    <label for="edit-plane-brandName" class="col-form-label form-label-group">Brand
                                        name</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-plane-description" name="plane.description" type="text"
                                           class="form-control form-control-lg" placeholder="Description">
                                    <label for="edit-plane-description" class="col-form-label form-label-group">Description</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-plane-price" name="plane.price" type="number"
                                           class="form-control form-control-lg" placeholder="Price">
                                    <label for="edit-plane-price" class="col-form-label form-label-group">Price</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-plane-speed" name="plane.speed" type="number"
                                           class="form-control form-control-lg" placeholder="Speed">
                                    <label for="edit-plane-speed" class="col-form-label form-label-group">Speed</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-plane-seats" name="plane.seats" type="number"
                                           class="form-control form-control-lg" placeholder="Seats">
                                    <label for="edit-plane-seats" class="col-form-label form-label-group">Seats</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input id="edit-plane-max" name="plane.maxFlyHight" type="number"
                                           class="form-control form-control-lg" placeholder="Max Fly Height">
                                    <label for="edit-plane-max" class="col-form-label form-label-group">Max Fly
                                        Height</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input id="edit-plane-min" name="plane.maxFlyMin" type="number"
                                           class="form-control form-control-lg" placeholder="Min Fly Height">
                                    <label for="edit-plane-min" class="col-form-label form-label-group">Min Fly
                                        Height</label>
                                </div>
                            </div>
                            <div class="text-center">
                                <input type="submit" class="btn btn-primary w-100 rounded-4 py-2" value="Save">
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
                    carField.style.display = 'none';

                } else {
                    carField.style.display = 'block';
                    boatField.style.display = 'none';

                }

                //takes the action of the type of vehicle.
                form.action = "add" + type;

                // Open modal
                modal.classList.add('show');
                console.log("Modal geopend");
            }


            window.onclick = function (event) {
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


            const editPlaneModal = document.getElementById('editPlane');
            editPlaneModal.addEventListener('show.bs.modal', (event) => {
                const info = event.relatedTarget
                const id = info.getAttribute('data-bs-id');
                const name = info.getAttribute('data-bs-name');
                const price = info.getAttribute('data-bs-price');
                const description = info.getAttribute('data-bs-description');
                const brandName = info.getAttribute('data-bs-brandName');
                const seats = info.getAttribute('data-bs-seats');
                const speed = info.getAttribute('data-bs-speed');
                const maxFlyMin = info.getAttribute('data-bs-maxFlyMin');
                const maxFlyHeight = info.getAttribute('data-bs-maxFlyHeight');

                // nieuwe input
                const idInput = document.getElementById('edit-plane-id');
                const nameInput = document.getElementById('edit-plane-name');
                const priceInput = document.getElementById('edit-plane-price');
                const descriptionInput = document.getElementById('edit-plane-description');
                const brandNameInput = document.getElementById('edit-plane-brandName');
                const seatsInput = document.getElementById('edit-plane-seats');
                const speedInput = document.getElementById('edit-plane-speed');
                const maxFlyMinInput = document.getElementById('edit-plane-min');
                const maxFlyHeightInput = document.getElementById('edit-plane-max');

                //Input overwrites oude info.
                idInput.value = id;
                nameInput.value = name;
                priceInput.value = price;
                descriptionInput.value = description;
                brandNameInput.value = brandName;
                seatsInput.value = seats;
                speedInput.value = speed;
                maxFlyMinInput.value = maxFlyMin;
                maxFlyHeightInput.value = maxFlyHeight
            });


            const editCarModal = document.getElementById('editCar');
            editCarModal.addEventListener('show.bs.modal', (event) => {
                const info = event.relatedTarget
                const id = info.getAttribute('data-bs-id');
                const name = info.getAttribute('data-bs-name');
                const price = info.getAttribute('data-bs-price');
                const description = info.getAttribute('data-bs-description');
                const brandName = info.getAttribute('data-bs-brandName');
                const seats = info.getAttribute('data-bs-seats');
                const speed = info.getAttribute('data-bs-speed');
                const horsePower = info.getAttribute('data-bs-horsePower');
                const carType = info.getAttribute('data-bs-carType');

                // nieuwe input
                const idInput = document.getElementById('edit-car-id');
                const nameInput = document.getElementById('edit-car-name');
                const priceInput = document.getElementById('edit-car-price');
                const descriptionInput = document.getElementById('edit-car-description');
                const brandNameInput = document.getElementById('edit-car-brandName');
                const seatsInput = document.getElementById('edit-car-seats');
                const speedInput = document.getElementById('edit-car-speed');
                const horsePowerInput = document.getElementById('edit-car-horsePower');
                const carTypeInput = document.getElementById('edit-car-cartype');

                //Input overwrites oude info.
                idInput.value = id;
                nameInput.value = name;
                priceInput.value = price;
                descriptionInput.value = description;
                brandNameInput.value = brandName;
                seatsInput.value = seats;
                speedInput.value = speed;
                horsePowerInput.value = horsePower;
                carTypeInput.value = carType
            });


            const editBoatModal = document.getElementById('editBoat');
            editBoatModal.addEventListener('show.bs.modal', (event) => {
                const info = event.relatedTarget
                const id = info.getAttribute('data-bs-id');
                const name = info.getAttribute('data-bs-name');
                const price = info.getAttribute('data-bs-price');
                const description = info.getAttribute('data-bs-description');
                const brandName = info.getAttribute('data-bs-brandName');
                const seats = info.getAttribute('data-bs-seats');
                const speed = info.getAttribute('data-bs-speed');
                const amountOfMotors = info.getAttribute('data-bs-amountOfMotors');
                const navigationGear = info.getAttribute('data-bs-navigationGear');

                // nieuwe input
                const idInput = document.getElementById('edit-boat-id');
                const nameInput = document.getElementById('edit-boat-name');
                const priceInput = document.getElementById('edit-boat-price');
                const descriptionInput = document.getElementById('edit-boat-description');
                const brandNameInput = document.getElementById('edit-boat-brandName');
                const seatsInput = document.getElementById('edit-boat-seats');
                const speedInput = document.getElementById('edit-boat-speed');
                const amountOfMotorsInput = document.getElementById('edit-boat-motors');
                const navigationGearInput = document.getElementById('edit-boat-navigation');

                //Input overwrites oude info.
                idInput.value = id;
                nameInput.value = name;
                priceInput.value = price;
                descriptionInput.value = description;
                brandNameInput.value = brandName;
                seatsInput.value = seats;
                speedInput.value = speed;
                amountOfMotorsInput.value = amountOfMotors;
                navigationGearInput.value = navigationGear;
            });


            document.addEventListener('DOMContentLoaded', function () {
                const viewBoatModal = document.getElementById('viewBoatModal');

                document.querySelectorAll('[data-bs-toggle="modal"]').forEach(function (button) {
                    button.addEventListener('click', function (event) {
                        const id = button.getAttribute('data-bs-id');
                        const name = button.getAttribute('data-bs-name');
                        const price = button.getAttribute('data-bs-price');
                        const description = button.getAttribute('data-bs-description');
                        const brandName = button.getAttribute('data-bs-brandName');
                        const seats = button.getAttribute('data-bs-seats');
                        const speed = button.getAttribute('data-bs-speed');
                        const amountOfMotors = button.getAttribute('data-bs-amountOfMotors');
                        const navigationGear = button.getAttribute('data-bs-navigationGear');

                        document.getElementById('viewId').innerText = id;
                        document.getElementById('viewName').innerText = name;
                        document.getElementById('viewBrandName').innerText = brandName;
                        document.getElementById('viewPrice').innerText = price;
                        document.getElementById('viewDescription').innerText = description;
                        document.getElementById('viewAmountOfMotors').innerText = amountOfMotors;
                        document.getElementById('viewNavigationGear').innerText = navigationGear;
                        document.getElementById('viewSeats').innerText = seats;
                        document.getElementById('viewSpeed').innerText = speed;

                        viewBoatModal.show();
                    });
                });
            });
        </script>
        </body>
    </jsp:attribute>
</t:template>
