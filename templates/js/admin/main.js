function validTime(field, rules, i, options) {
    if (field.val() && /^(([0-1]?[0-9])|([2][0-3])):([0-5]?[0-9])$/i.test(field.val()) == false)
    {
        return "Tiempo inválido.";
    }
}