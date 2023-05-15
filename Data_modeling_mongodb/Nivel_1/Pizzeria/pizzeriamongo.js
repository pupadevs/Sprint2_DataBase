db.createCollection('Tiendas',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "localidad",
    "provincia"
  ],
  "properties": {
    "Direccion": {
      "bsonType": "object",
      "properties": {
        "num_carrer": {
          "bsonType": "string"
        },
        "Calle": {
          "bsonType": "string"
        },
        "codigo_postal": {
          "bsonType": "int"
        }
      }
    },
    "empleados": {
      "bsonType": "array",
      "items": {
        "bsonType": "null"
      }
    },
    "localidad": {
      "bsonType": "string"
    },
    "provincia": {
      "bsonType": "string"
    }
  }
} }});

db.createCollection('Clientes',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "apellido1",
    "Nom"
  ],
  "properties": {
    "apellido2": {
      "bsonType": "string"
    },
    "apellido1": {
      "bsonType": "string"
    },
    "Direccion": {
      "bsonType": "object",
      "properties": {
        "calle": {
          "bsonType": "string"
        },
        "codigo_postal": {
          "bsonType": "int"
        },
        "piso": {
          "bsonType": "string"
        },
        "puerta": {
          "bsonType": "string"
        }
      }
    },
    "província": {
      "bsonType": "string"
    },
    "localidad": {
      "bsonType": "string"
    },
    "Nom": {
      "bsonType": "string"
    },
    "tlf": {
      "bsonType": "int"
    }
  }
} }});

db.createCollection('Pedidos',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "data",
    "precio_total",
    "tipo_pedido"
  ],
  "properties": {
    "producto_comanda": {
      "bsonType": "array",
      "items": {
        "bsonType": "object",
        "properties": {
          "id_producte": {
            "bsonType": "objectId"
          },
          "cantidad": {
            "bsonType": "int"
          }
        }
      }
    },
    "data": {
      "bsonType": "timestamp"
    },
    "id_botiga": {
      "bsonType": "objectId"
    },
    "id_client": {
      "bsonType": "objectId"
    },
    "id_repartidor": {
      "bsonType": "objectId"
    },
    "preu_total": {
      "bsonType": "double"
    },
    "tipo_pedido": {
      "enum": [
        "a_domicilio",
        "recoger"
      ]
    }
  }
} }});

db.createCollection('Empleados',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "apellido1",
    "nom"
  ],
  "properties": {
    "apellido2": {
      "bsonType": "string"
    },
    "apellido1": {
      "bsonType": "string"
    },
    "id_botiga": {
      "bsonType": "objectId"
    },
    "tipo_empleado": {
      "enum": [
        "cocinero",
        "repartidor"
      ]
    },
    "nom": {
      "bsonType": "string"
    },
    "tlf": {
      "bsonType": "int"
    }
  }
} }});

db.createCollection('Productos',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "tipos_producto",
    "nom"
  ],
  "properties": {
    "tipos_producto": {
      "enum": [
        "pizza",
        "haburguesa",
        "bebida"
      ]
    },
    "precio": {
      "bsonType": "double"
    },
    "descripcion": {
      "bsonType": "string"
    },
    "tipos_pizza": {
      "bsonType": "string"
    },
    "nom": {
      "bsonType": "string"
    },
    "imagen": {
      "bsonType": "string"
    }
  }
} }});
