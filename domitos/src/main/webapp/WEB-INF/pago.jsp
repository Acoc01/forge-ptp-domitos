<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>Integration Example - Card Payment</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/pago.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://sdk.mercadopago.com/js/v2"></script>
    <script type="text/javascript" src="js/pago.js" defer></script>
</head>
<body>
<main>

    <!-- Shopping Cart -->
    <section class="shopping-cart dark">
        <div class="container container__cart">
            <div class="block-heading">
                <h2>Detalles del Domo</h2>
                <p>${ domo.nombre } ${ domo.apellido }</p>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-12 col-lg-8">
                        <div class="items">
                            <div class="product">
                                <div class="info">
                                    <div class="product-details">
                                        <div class="row justify-content-md-center">
                                            <div class="col-md-3">
                                                <img class="img-fluid mx-auto d-block image" src="@{/img/product.png}">
                                            </div>
                                            <div class="col-md-4 product-detail">
                                                <h5>Domo</h5>
                                                <div class="product-info">
                                                    <p><b>Nombre: </b><span id="product-description">${ domo.nombre } ${ domo.apellido }</span><br>
                                                     <!--     <b>Author: </b>Dale Carnegie<br>
                                                        <b>Number of pages: </b>336<br> -->
                                                        <b>Precio:</b> $ <span id="unit-price">${ precio }</span></p>
                                                </div>
                                            </div>
                                            <!--  <div class="col-md-3 product-detail">
                                                <label for="quantity"><h5>Quantity</h5></label>
                                                <input type="number" id="quantity" value="1" min="1" class="form-control">
                                            </div> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-4">
                        <div class="summary">
                            <div class="summary-item"><span class="text">Subtotal</span><span class="price" id="cart-total"></span></div>
                            <button class="btn btn-primary btn-lg btn-block" id="checkout-btn">Pagar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Payment -->
    <section class="payment-form dark">
        <div class="container__payment">
            <div class="block-heading">
                <h2>Pago con Tarjeta</h2>
                <p>Ingrese los datos de su tarjeta para finalizar la compra del servicio.</p>
            </div>
            <div class="form-payment">
                <div class="products">
                    <h2 class="title">Resumen</h2>
                    <div class="item">
                        <!--  <span class="price" id="summary-price"></span> -->
                        <p class="item-name">Servicio Personalizado<span id="summary-quantity"></span></p>
                    </div>
                    <div class="total">Total<span class="price" id="summary-total"></span></div>
                </div>
                <div class="payment-details">
                    <form id="form-checkout">
                        <h3 class="title">Detalles del Comprador</h3>
                        <div class="row">
                            <div class="form-group col">
                                <input id="form-checkout__cardholderEmail" name="cardholderEmail" type="email" class="form-control"/>
                            </div>
                        </div>
                        <br>
                        <h3 class="title">Detalles de la Tarjeta</h3>
                        <div class="row">
                            <div class="form-group col-sm-8">
                                <input id="form-checkout__cardholderName" name="cardholderName" type="text" class="form-control"/>
                            </div>
                            <div class="form-group col-sm-4">
                                <div class="input-group expiration-date">
                                    <div id="form-checkout__expirationDate" class="form-control h-40"></div>
                                </div>
                            </div>
                            <div class="form-group col-sm-8">
                                <div id="form-checkout__cardNumber" class="form-control h-40"></div>
                            </div>
                            <div class="form-group col-sm-4">
                                <div id="form-checkout__securityCode" class="form-control h-40"></div>
                            </div>
                            <div id="issuerInput" class="form-group col-sm-12 hidden">
                                <select id="form-checkout__issuer" name="issuer" class="form-control"></select>
                            </div>
                            <div class="form-group col-sm-12">
                                <select id="form-checkout__installments" name="installments" type="text" class="form-control"></select>
                            </div>
                            <div class="form-group col-sm-12">
                                <input type="hidden" id="amount" />
                                <input type="hidden" id="description" />
                                <div id="validation-error-messages">
                                </div>
                                <br>
                                <button id="form-checkout__submit" type="submit" class="btn btn-primary btn-block">Pagar</button>
                                <br>
                                <p id="loading-message">Cargando, por favor espere...</p>
                                <br>
                                <a id="go-back">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 10 10" class="chevron-left">
                                        <path fill="#009EE3" fill-rule="nonzero"id="chevron_left" d="M7.05 1.4L6.2.552 1.756 4.997l4.449 4.448.849-.848-3.6-3.6z"></path>
                                    </svg>
                                   	Volver 
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- Result -->
    <section class="shopping-cart dark">
        <div class="container container__result">
            <div class="block-heading">
                <h2>Payment Result</h2>
                <p>This is an example of a Mercado Pago integration</p>
            </div>
            <div class="content">
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="items product info product-details">
                            <div class="row justify-content-md-center">
                                <div class="col-md-4 product-detail">
                                    <div class="product-info">
                                        <div id="fail-response">
                                            <br/>
                                            <img th:src="@{/img/fail.png}" width="350px">
                                            <p class="text-center font-weight-bold">Something went wrong</p>
                                            <p id="error-message" class="text-center"></p>
                                            <br/>
                                        </div>

                                        <div id="success-response">
                                            <br/>
                                            <p><b>ID: </b><span id="payment-id"></span></p>
                                            <p><b>Status: </b><span id="payment-status"></span></p>
                                            <p><b>Detail: </b><span id="payment-detail"></span></p>
                                            <br/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<footer>
    <div class="footer_logo"><img id="horizontal_logo" src="@{/img/horizontal_logo.png}"></div>
    <div class="footer_text">
        <p>Developers Site:</p>
        <p><a href="https://www.mercadopago.com/developers">https://www.mercadopago.com/developers</a></p>
    </div>
</footer>
</body>
</html>
