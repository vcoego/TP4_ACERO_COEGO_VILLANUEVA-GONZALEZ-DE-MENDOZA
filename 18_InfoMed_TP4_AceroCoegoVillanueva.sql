SELECT med.nombre AS medicamento,
       COUNT(*) OVER (PARTITION BY med.id_medicamento) AS total_recetas,
       m.nombre AS medico,
       p.nombre AS paciente
FROM Recetas r
INNER JOIN Medicamentos med ON r.id_medicamento = med.id_medicamento
INNER JOIN Medicos m ON r.id_medico = m.id_medico
INNER JOIN Pacientes p ON r.id_paciente = p.id_paciente
ORDER BY total_recetas DESC, med.nombre, m.nombre, p.nombre;
