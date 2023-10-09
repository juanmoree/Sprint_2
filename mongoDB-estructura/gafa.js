db.createCollection("gafa",
{
    validator:
    {
        $jsonSchema:
        {
            bsonType: "object",
            required: ["marca", "graduacionCristal1", "graduacionCristal2", "montura", "colorMontura", "colorVidrio", "precio"],
            properties: {
                marca: {bsonType: "string", description: "Marca - Requerido"},
                graduacionCristal1: {bsonType: "decimal", description: "Graduacion cristal 1 - Requerido"},
                graduacionCristal2: {bsonType: "decimal", description: "Graduacion cristal 2 - Requerido"},
                montura: {enum: ['flotante', 'pasta', 'metalica'], description: "Tipo montura - Requerido"},
                colorMontura: {bsonType: "string", description: "Color montura - Requerido"},
                colorVidrio: {bsonType: "string", description: "Color lentes - Requerido"},
                precio: {bsonType: "decimal", description: "Precio - Requerido"}
            }
        }
    }
})