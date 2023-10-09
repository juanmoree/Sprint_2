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