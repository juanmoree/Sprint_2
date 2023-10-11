// **** Collection "PROVEEDOR" ****

db.createCollection("proveedor",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                required: ["nombre", "direccion", "telefono", "fax", "nif"],
                properties: {
                    nombre: { bsonType: "string", description: "Nombre proveedor - Requerido." },
                    direccion: {
                        bsonType: "object", required: ["calle", "numero", "piso", "puerta", "ciudad", "codigo_postal", "pais"],
                        properties: {
                            calle: { bsonType: "string", description: "Calle - Requerido." },
                            numero: { bsonType: "int", description: "Numero - Requerido." },
                            piso: { bsonType: "int", description: "Piso - Requerido." },
                            puerta: { bsonType: "string", description: "puerta - Requerido." },
                            ciudad: { bsonType: "string", description: "Ciudad - Requerido." },
                            codigo_postal: { bsonType: "int", description: "Codigo postal - Requerido." },
                            pais: { bsonType: "int", description: "Pais - Requerido." }
                        }
                    },
                    telefono: { bsonType: "int", description: "Telefono proveedor - Requerido." },
                    fax: { bsonType: "int", description: "Fax proveedor - Requerido." },
                    nif: { bsonType: "string", description: "NIF proveedor - Requerido." }
                }
            }
        }
    }
)

// **** Collection "GAFA" ****

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

db.gafa.aggregate([
    {
        from: "proveedor",
        localField: "_id",
        foreignField: "_id",
        as: "proveedor_gafa",
      }
])

// Collection "CLIENTE" ****

db.createCollection("cliente:", {
    validator: {
        $jsonSchema:
        {
            bsonType: "object",
            required: ["nombre", "direccion", "telefono", "email", "fecha_registro",],
            properties: {
                nombre: {bsonType: "string", description: "Nombre cliente - Requerido"},
                direccion: {bsonType: "object", required: ["calle", "numero", "piso", "puerta", "ciudad", "codigo_postal", "pais"],
                properties: {
                    calle: { bsonType: "string", description: "Calle - Requerido." },
                            numero: { bsonType: "int", description: "Numero - Requerido." },
                            piso: { bsonType: "int", description: "Piso - Requerido." },
                            puerta: { bsonType: "string", description: "puerta - Requerido." },
                            ciudad: { bsonType: "string", description: "Ciudad - Requerido." },
                            codigo_postal: { bsonType: "int", description: "Codigo postal - Requerido." },
                            pais: { bsonType: "int", description: "Pais - Requerido." }
                }
            },
            telefono: {bsonType: "int", description: "Telefono cliente - Requerido"},
            email: {bsonType: "string", description: "Email cliente - Requqerido"},
            fecha_registro: {bsonType: "date", description: "Fecha registro - Requerida"},
            codigo_referido: {bsonType: "int", description: "Codigo referido - Opcional"}
            }
        }
    }
})

// **** Collection "Empleado" ****

db.createCollection("empleado",
{
    validator:
    {
        $jsonSchema:
        {
            bsonType: "object",
            required: ["nombre"],
            properties: {
                nombre: {bsonType: "string", description: "Nombre empleado - Requerido"}
            }
        }
    }
})

// **** Collection "VENTA" ****

db.createCollection("venta", {})

db.venta.aggregate([
    {
        from: "gafa",
        localField: "_id",
        foreignField: "_id",
        as: "venta_gafa",
      }
])

db.venta.aggregate([
    {
        from: "empleado",
        localField: "_id",
        foreignField: "_id",
        as: "venta_empleado",
      }
])

db.venta.aggregate([
    {
        from: "cliente",
        localField: "_id",
        foreignField: "_id",
        as: "venta_cliente",
      }
])

// **** Collection "REFERIDO" ****

db.createCollection("referido", {})

db.referido.aggregate([
    {
        from: "cliente",
        localField: "_id",
        foreignField: "codigo_referido",
        as: "referido_cliente",
      }
])