

db.createCollection('Clientes',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "data_registre",
    "nom"
  ],
  "properties": {
    "direccion": {
      "bsonType": "object",
      "properties": {
        "c_postal": {
          "bsonType": "int"
        },
        "numero": {
          "bsonType": "int"
        },
        "ciudad": {
          "bsonType": "string"
        },
        "carrer": {
          "bsonType": "string"
        },
        "piso": {
          "bsonType": "int"
        },
        "puerta": {
          "bsonType": "int"
        },
        "pais": {
          "bsonType": "string"
        }
      }
    },
    "data_registre": {
      "bsonType": "timestamp"
    },
    "nombre": {
      "bsonType": "string"
    },
    "email": {
      "bsonType": "string"
    },
    "recomendacion": {
      "bsonType": "objectId"
    },
    "tlf": {
      "bsonType": "int"
    }
  }
} }});

db.createCollection('Collection',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {}
} }});

use('optica3');db.createCollection('Provedor',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "direccion",
    "nif/nie",
    "nom",
    "tlf"
  ],
  "properties": {
    "direccion": {
      "bsonType": "object",
      "required": [
        "c_postal",
        "ciudad",
        "carrer"
      ],
      "properties": {
        "c_postal": {
          "bsonType": "int"
        },
        "numero": {
          "bsonType": "string"
        },
        "ciudad": {
          "bsonType": "string"
        },
        "carrer": {
          "bsonType": "string"
        },
        "piso": {
          "bsonType": "string"
        },
        "puerta": {
          "bsonType": "string"
        },
        "pais": {
          "bsonType": "string"
        }
      }
    },
    "nif/nie": {
      "bsonType": "string"
    },
    "nombre": {
      "bsonType": "string"
    },
    "tlf": {
      "bsonType": "int"
    }
  }
} }});

db.createCollection('Gafas',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "properties": {
    "color_esq": {
      "bsonType": "string"
    },
    "marca": {
      "bsonType": "string"
    },
    "gra_dre": {
      "bsonType": "double"
    },
    "color_montura": {
      "bsonType": "string"
    },
    "precio": {
      "bsonType": "double"
    },
    "gra_esq": {
      "bsonType": "double"
    },
    "tipus_montura": {
      "enum": [
        "metàl·lica",
        "pasta",
        "flotant"
      ]
    },
    "color_dre": {
      "bsonType": "string"
    },
    "id_proveidor": {
      "bsonType": "int"
    }
  }
} }});

db.createCollection('ventas',{ validator: { $jsonSchema: {
  "bsonType": "object",
  "required": [
    "ulleres",
    "id_client",
    "id_empleat"
  ],
  "properties": {
    "ulleres": {
      "bsonType": "array",
      "items": {
        "bsonType": "null"
      }
    },
    "id_client": {
      "bsonType": "objectId"
    },
    "data_venta": {
      "bsonType": "timestamp"
    },
    "id_empleat": {
      "bsonType": "objectId"
    }
  }
} }});
