$(document).ready(function() {

    var quantity = $('input.form-control.quantity-input') // Input fields for amount of books
    var amount = parseInt(quantity.val());
    $('a>i.fa.fa-minus').click(function(){
        if (amount > 1) {
            amount -= 1
            quantity.val(amount);
        }
    });

    $('a>i.fa.fa-plus').click(function(){
        amount += 1
        quantity.val(amount);
    });

});