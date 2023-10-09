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
            fecha_registro: {bsonType: "date", description: "Fecha registro - Requerida"}
            }
        }
    }
})