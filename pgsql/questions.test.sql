-- Process: GP-1
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Проходит ли аудит процесса?', '{Да, 75%, 50%, 25%}', '{1,2}', 1, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Проводится ли тестирование процесса?', '{Да, Нет}', '{1,2}', 2, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Осуществляется ли мониторинг и планирование процесса?', '{Да, Нет}', '{1}', 3, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Производится ли оценка процесса?', '{Да, Нет}', '{1}', 4, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Осуществляется ли оптимизация процесса на основе полученных данных по метрикам?', '{Да, Нет}', '{1}', 5, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Существуют ли документы регламентирующие область «Управление знаниями»?', '{Да, Нет}', '{1}', 6, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Количество обновлённых документов в год (как отношение обновленных документов к общему количеству)', '{100%, 75%, 50%, 25%, 0%}', '{1}', 7, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Процентное соотношение документов существующих процессов к общему количеству процессов', '{100%, 75%, 50%, 25%, 0%}', '{1}', 8, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Время недоступности БД знаний в связи инцидента?', '{меньше часа, полдня, день, восстановление требует больше одного дня, БД отсутствует}', '{1}', 9, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Оцените эффективность процесса (отношение полученной прибыли к затратам на процесс, выраженной в %)', '{100%, 75%, 50%, 25%, 0%}', '{1}', 10, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Насколько экономически эффективен процесс?', '{Экономически эффективен, Экономически неэффективен}', '{11}', 11, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Какое количество ресурсов процесс использует?', '{100%, 75%, 50%, 25%, 0%}', '{1}', 12, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Какова результативность процесса?(Определяется как отношение количества выполненных целей к количеству поставленных целей; измеряется в процентах)', '{100%, 75%, 50%, 25%, 0%}', '{1}', 13, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Оцените качество процесса (зависит от итоговой оценки результативности)', '{высокое, хорошее, среднее, низкое, неудовлетворительное}', '{1}', 14, 1) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Какой процент событий ИБ эскалировали до инцидента ИБ?', '{0%, 25%, 50%, 75%, 100%}', '{1}', 15, 1) RETURNING id;


-- Process: GP-2:
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Проходит ли аудит процесса?', '{Да, 75%, 50%, 25%}', '{1,2}', 1, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Проводится ли тестирование процесса?', '{Да, Нет}', '{1,2}', 2, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Осуществляется ли мониторинг и планирование процесса?', '{Да, Нет}', '{1}', 3, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Производится ли оценка процесса?', '{Да, Нет}', '{1}', 4, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Осуществляется ли оптимизация процесса на основе полученных данных по метрикам?', '{Да, Нет}', '{1}', 5, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Существуют ли документы регламентирующие область «Управление знаниями»?', '{Да, Нет}', '{1}', 6, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Количество обновлённых документов в год (как отношение обновленных документов к общему количеству)', '{100%, 75%, 50%, 25%, 0%}', '{1}', 7, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Процентное соотношение документов существующих процессов к общему количеству процессов', '{100%, 75%, 50%, 25%, 0%}', '{1}', 8, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Время недоступности БД знаний в связи инцидента?', '{меньше часа, полдня, день, восстановление требует больше одного дня, БД отсутствует}', '{1}', 9, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Оцените эффективность процесса (отношение полученной прибыли к затратам на процесс, выраженной в %)', '{100%, 75%, 50%, 25%, 0%}', '{1}', 10, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Насколько экономически эффективен процесс?', '{Экономически эффективен, Экономически неэффективен}', '{11}', 11, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Какое количество ресурсов процесс использует?', '{100%, 75%, 50%, 25%, 0%}', '{1}', 12, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Какова результативность процесса?(Определяется как отношение количества выполненных целей к количеству поставленных целей; измеряется в процентах)', '{100%, 75%, 50%, 25%, 0%}', '{1}', 13, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Оцените качество процесса (зависит от итоговой оценки результативности)', '{высокое, хорошее, среднее, низкое, неудовлетворительное}', '{1}', 14, 2) RETURNING id;
INSERT INTO questions(id, name, variants, correct_answers, weight, process_id) VALUES(DEFAULT, 'Какой процент событий ИБ эскалировали до инцидента ИБ?', '{0%, 25%, 50%, 75%, 100%}', '{1}', 15, 2) RETURNING id;
