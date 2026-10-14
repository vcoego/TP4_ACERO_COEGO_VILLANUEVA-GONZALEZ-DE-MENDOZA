SELECT m.nombre AS medico,
       COUNT(c.id_consulta) AS consultas_menores,
       CASE
           WHEN e.nombre = 'Pediatría' THEN TRUE
           ELSE FALSE
       END AS es_pediatra
FROM Medicos m
LEFT JOIN Especialidades e ON m.especialidad_id = e.id_especialidad
LEFT JOIN Consultas c ON m.id_medico = c.id_medico
    AND c.id_paciente IN (
        SELECT id_paciente
        FROM Pacientes
        WHERE fecha_nacimiento > CURRENT_DATE - INTERVAL '18 years'
    )
GROUP BY m.id_medico, m.nombre, e.nombre
ORDER BY m.nombre;
