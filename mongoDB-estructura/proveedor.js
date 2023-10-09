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