# Limpiar las tablas antes de crear nuevos registros
puts "Limpiando tablas..."

User.destroy_all
JobOffer.destroy_all
JobApplication.destroy_all

puts "Tablas limpiadas exitosamente."

# Crear el administrador
admin = User.create!(
  name: 'Esteban',
  email: 'admin@admin.com',
  password: '123456',
  password_confirmation: '123456',
  role: 1  # Asignar rol de administrador
)

# Crear usuarios normales
usuario1 = User.create!(
  name: 'Usuario1',
  email: 'usuario1@mail.com',
  password: '123456',
  password_confirmation: '123456',
  role: 0  # Rol de usuario normal
)

usuario2 = User.create!(
  name: 'Usuario2',
  email: 'usuario2@mail.com',
  password: '123456',
  password_confirmation: '123456',
  role: 0  # Rol de usuario normal
)

usuario3 = User.create!(
  name: 'Usuario3',
  email: 'usuario3@mail.com',
  password: '123456',
  password_confirmation: '123456',
  role: 0  # Rol de usuario normal
)

# Crear ofertas de trabajo
job_offer1 = JobOffer.create!(
  title: 'Analista de datos',
  description: 'Recopilar y depurar los datos de diversas fuentes para garantizar su exactitud y fiabilidad. Utilizar herramientas estadísticas para analizar datos e identificar tendencias, correlaciones y patrones. Desarrollar e implantar bases de datos y sistemas de recopilación de datos para una calidad y eficacia óptimas de los datos. Crear visualizaciones e informes para comunicar claramente los resultados analíticos a las partes interesadas. Colaborar con equipos multifuncionales para comprender las necesidades de datos y ofrecer perspectivas procesables. Mejorar continuamente los procesos de recogida y análisis de datos mediante la aplicación de nuevas tecnologías y metodologías.'
)

job_offer2 = JobOffer.create!(
  title: 'Administrador de Obra',
  description: 'Buscamos el responsable de coordinar y supervisar todos los aspectos administrativos, financieros y de gestión de un proyecto de construcción. Su labor abarca desde la planificación inicial hasta el cierre del proyecto, asegurando que se cumplan los objetivos en términos de tiempo, costos y calidad. Entre las funciones clave se incluyen: Gestión de recursos humanos: organizar el personal, establecer los roles y responsabilidades, gestionar la mano de obra, resolver conflictos laborales y garantizar el cumplimiento de los estándares de seguridad laboral. Control de costos: elaborar y monitorear el presupuesto del proyecto, analizar los costos de mano de obra y materiales, administrar los contratos y subcontratos, y asegurar que se cumplan las restricciones presupuestarias. Gestión del tiempo: planificar y coordinar el cronograma de trabajo, establecer los plazos de entrega, supervisar la secuencia de actividades y controlar el avance físico y financiero del proyecto. Administración de la información: manejar la documentación del proyecto, coordinar las comunicaciones entre los diferentes equipos, organizar las reuniones de obra y asegurar el cumplimiento de los requerimientos legales y normativos.'
)

job_offer3 = JobOffer.create!(
  title: 'Gerente de Finanzas',
  description: 'Supervisar las decisiones de inversión y crear informes financieros. Generar análisis de datos, para ayudar a encontrar estrategias que mejoren la salud financiera de la organización. Trabajar con los gerentes senior y los altos ejecutivos de la empresa para maximizar las ganancias. Debe ser preciso con sus informes financieros para garantizar que las sugerencias que hagan ayuden al negocio.'
)

puts "Administrador y usuarios creados exitosamente"
puts "Ofertas de trabajo creadas exitosamente"
