//Crear Base de datos
use g32

//Crear colecciom
db.createCollection("notas_grupo32")

//Insertar datos	
db.notas_grupo32.insert(
    {
        NombreMateria: "Cálculo",
        CantidadHoras: "2",
        AreaDiciplinar: "Matemáticas",
        NotasMateria: {
            Sprint1: "",
            Sprint2: "",
            Sprint3: "",
            Sprint4: ""
        }
    }
)

db.notas_grupo32.insert(
    {
        NombreMateria: "Lenguaje",
        CantidadHoras: "2",
        AreaDiciplinar: "Lengua Castellana",
        NotasMateria: {
            Sprint1: "",
            Sprint2: "",
            Sprint3: "",
            Sprint4: ""
        }
    }
)

db.notas_grupo32.insert(
    {
        NombreMateria: "Ingles",
        CantidadHoras: "2",
        AreaDiciplinar: "Lengia Extranjera",
        NotasMateria: {
            Sprint1: "",
            Sprint2: "",
            Sprint3: "",
            Sprint4: ""
        }
    }
)

//consultar registro
db.notas_grupo32.find()
db.notas_grupo32.find().pretty()
