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
                    direccion: { bsonType: "string", description: "Direccion cliente - Requerido." },
                    codigo_postal: { bsonType: "int", description: "Codigo postal cliente - Requerido." },
                    telefono: { bsonType: "int", description: "Telefono cliente - Requerido." }
                }
            }
        }
    })

db.cliente.aggregate([
    {
        from: "localidad",
        localField: "_id",
        foreignField: "_id",
        as: "localidad_cliente",
    }
])

// **** Collection "LOCALIDAD" ****

db.createCollection("localidad",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                required: ["nombre"],
                properties: {
                    nombre: { bsonType: "string", description: "Nombre localidad - Requerido" }
                }
            }
        }
    })

db.localidad.aggregate([
    {
        from: "provincia",
        localField: "_id",
        foreignField: "_id",
        as: "localidad_provincia",
    }
])

// **** Collection "PROVINCIA" ****

db.createCollection("provincia",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                required: ["nombre"],
                properties: {
                    nombre: { bsonType: "string", description: "Nombre provincia - Requerido" }
                }
            }
        }
    })

// **** Collection "PEDIDO" ****

db.createCollection("pedido",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                required: ["fecha_hora", "recogida", "cantidad", "total"],
                properties: {
                    fecha_hora: { bsonType: "date", description: "Fecha y hora pedido - Requerido" },
                    recogida: { enum: ['domicilio', 'tienda'], description: "Domicilio o recogida en tienda? - Requerido" },
                    cantidad: { bsonType: "int", description: "Cantidad - Requerida" },
                    total: { bsonType: "decimal", description: "Total - Requerido" }
                }
            }
        }
    })

db.pedido.aggregate([
    {
        from: "cliente",
        localField: "_id",
        foreignField: "_id",
        as: "cliente_pedido",
    }
])

db.pedido.aggregate([
    {
        from: "empleado",
        localField: "_id",
        foreignField: "_id",
        as: "repartidor_pedido",
    }
])

db.pedido.aggregate([
    {
        from: "tienda",
        localField: "_id",
        foreignField: "_id",
        as: "tienda_pedido",
    }
])

db.pedido.aggregate([
    {
        from: "producto",
        localField: "_id",
        foreignField: "_id",
        as: "productos_pedido",
      }
])

// **** Collection "TIENDA" ****

db.createCollection("tienda",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                required: ["direccion", "codigo_postal"],
                properties: {
                    direccion: { bsonType: "string", description: "Direccion tienda - Requerido" },
                    codigo_postal: { bsonType: "int", description: "Codigo postal tienda - Requerido" }
                }
            }
        }
    })

db.tienda.aggregate([
    {
        from: "localidad",
        localField: "_id",
        foreignField: "_id",
        as: "localidad_tienda",
    }
])

// **** Collection "PRODUCTO" ****

db.createCollection("producto",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                required: ["nombre", "descripcion", "imagen", "precio"],
                properties: {
                    nombre: { bsonType: "string", description: "Nombre producto - Requerido" },
                    descripcion: { bsonType: "string", description: "Descripcion producto - Requerido" },
                    imagen: { bsonType: "binData", description: "Imagen producto - Requerida" },
                    precio: { bsonType: "decimal", description: "Precio producto - Requerido" }
                }
            }
        }
    })

db.producto.aggregate([
    {
        from: "categoria",
        localField: "_id",
        foreignField: "_id",
        as: "categoria_producto",
    }
])

// **** Collection "CATEGORIA" ****

db.createCollection("categoria",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                required: ["nombre"],
                properties: {
                    nombre: { bsonType: "string", description: "Nombre categoria - Requerido" }
                }
            }
        }
    })

// **** Collection "EMPLEADO" ****

db.createCollection("empleado",
    {
        validator:
        {
            $jsonSchema:
            {
                bsonType: "object",
                required: ["nombre", "apellidos", "nif", "telefono", "cargo"],
                properties: {
                    nombre: { bsonType: "string", description: "Nombre empleado - Requerido" },
                    apellidos: { bsonType: "string", description: "Apellidos empleado - Requerido" },
                    nif: { bsonType: "binData", description: "NIF empleado - Requerido" },
                    telefono: { bsonType: "int", description: "Telefono empleado - Requerido" },
                    cargo: { enum: ['cocinero', 'repartidor'], description: "Cargo empleado - Requerido" }
                }
            }
        }
    })