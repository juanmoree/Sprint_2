// **** Collection "PROVEEDOR" ****

db.createCollection("cliente",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                required: ["nombre", "apellidos", "direccion", "codigo_postal", "telefono"],
                properties: {
                    nombre: { bsonType: "string", description: "Nombre cliente - Requerido." },
                    apellidos: { bsonType: "string", description: "Apellidos cliente - Requerido." },
                    direccion: { bsonType: "string", description: "Direccion cliente - Requerido."},
                    nombre: { bsonType: "int", description: "Codigo postal cliente - Requerido." },
                    telefono: { bsonType: "int", description: "Telefono proveedor - Requerido." },
                    fax: { bsonType: "int", description: "Fax proveedor - Requerido." },
                    nif: { bsonType: "string", description: "NIF proveedor - Requerido." }
                }
            }
        }
    }
)