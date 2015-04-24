-- Process: GP-1
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{соглашения о конфиденциальности или неразглашении, поддержка безопасности в рамках соглашений с поставщиками, надлежащее использование активов, документированные рабочие процедуры, соглашения по передаче информации, политика управления доступом, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда происходит обновление документов в течении года?', '{12, 4, 2, 1}', '{5, 4, 3, 2}', NULL, 5, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 2, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 1, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 1);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 1);


-- Process: GP-2:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{политика ИБ, независимый анализ ИБ, управление аудитом ИС, контроль и анализ услуг поставщика, соответствие политикам безопасности и стандартам, не применяются}', NULL, '{1,2,3,4,5}', NULL, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз в год проводится внутренний аудит?', '{4, 3, 2, 1}', '{5, 4, 3, 2}', NULL, 5, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 4, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 4, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 4, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 2);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 2);


-- Process: GP-3:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{контакты с профессиональными сообществами, соответствие законодательным и договорным требованиям, роли и ответственность в системе ИБ, не применяются}', NULL, '{1,2,3}', NULL, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Частота проведения процедуры анкетирования сотрудник, ответственные за СУИБ?', '{2, 1, по приказу, 0}', '{5, 4, 3, 2}', NULL, 5, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 3, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 3);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 3);


-- Process: SSP-1:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда проходит отчёт заинтересованный лицам в области ИБ?', '{4, 3, 2, 1}', '{5, 4, 3, 2}', NULL, 5, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 0, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 0, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 4, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 4);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 4);


-- Process: SSP-2:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда проходит координирование деятельности в области ИБ с руководством организации?  ', '{12, 6, 2, 1}', '{5, 4, 3, 2}', NULL, 5, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 0, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 0, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 4, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 5);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 5);


-- Process: SSP-4:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{роли и ответственность в системе ИБ, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько создается учетных записей, удовлетворяющих требованиям правила распределения ролей?', '{все, 1 не соответствует, половина соответствует, все не соответствуют}', '{5, 4, 3, 2}', NULL, 5, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 4, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 6);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 6);


-- Process: SSP-6:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда происходит распределение бюджета на процессы тактического и операционного уровня на год?', '{1, 2, 3, 4}', '{5, 4, 3, 2}', NULL, 5, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 4, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 7);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 7);


-- Process: TSP-1:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз в год проходит предоставление отчёта стратегическому уровню в год?', '{4, 3, 2, 1}', '{5, 4, 3, 2}', NULL, 5, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 2, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 8);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 8);


-- Process: TSP-2:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз в год проходит предоставление отчёт о выделенных ресурсах на процесс?', '{4, 3, 2, 1}', '{5, 4, 3, 2}', NULL, 5, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 2, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 9);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 9);


-- Process: TSP-3:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{политика ИБ, маркировка информации, поддержка безопасности в рамках соглашений с поставщиками, не применяются}', NULL, '{1,2,3}', NULL, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Для каких процессов СУИБ определены цели ИБ?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 10);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 0, 10);


-- Process: TSP-4:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{роли и ответственность в системе ИБ, контакты с профессиональными сообществами, политика управления доступом, управление производительностью, управления сетями, управление предоставлением услуг поставщиком, конфиденциальность и защита ПДн, регулирование криптографических методов, не применяются}', NULL, '{1,2,3,4,5,6,7,8}', NULL, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда происходит сбор метрик процессов СУИБ?', '{еженедельно, ежемесячно, раз в полгода, в конце года}', '{5, 4, 3, 2}', NULL, 5, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 3, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 3, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 3, 11);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 11);


-- Process: TSP-6:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{безопасность в процессах разработки и поддержки, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько подсистем ИБ соответствует требованиям архитектуры безопасности?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 12);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 12);


-- Process: TSP-7:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какое количество биографии соискателей подлежат проверку?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 13);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 13);


-- Process: TSP-8:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{обязательства в трудовом соглашении, ответственность руководства, возврат активов, не применяются}', NULL, '{1,2,3}', NULL, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько сотрудников подписали соглашение о неразглашении конфиденциальной информации?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 14);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 14);


-- Process: TSP-9:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{физическое перемещение носителей информации, использование секретной информации для аутентификации, оставленное без присмотра пользовательское оборудование, политика чистого стола и чистого экрана, не применяются}', NULL, '{1,2,3,4}', NULL, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз проходит обучение в области ИБ в году?', '{ежегодно, раз в два года, раз в три года, не проходит}', '{5, 4, 3, 2}', NULL, 5, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 15);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 15);


-- Process: TSP-10:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{дисциплинарные взыскания, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда предоставляется отчёт о дисциплинарных взысканиях?', '{ежемесячно, раз в полгода, раз в год, не предоставляется}', '{5, 4, 3, 2}', NULL, 5, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 16);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 16);


-- Process: TSP-11:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{знание требований по ОИБ, образование и обучение, использование секретной информации для аутентификации, оставленное бе3 присмотра пользовательское оборудование, политика чистого стола и чистого экрана, не применяются}', NULL, '{1,2,3,4}', NULL, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз проходит осведомление сотрудников в области ИБ в год?', '{ежегодно, раз в два года, раз в три года, не проходит}', '{5, 4, 3, 2}', NULL, 5, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 17);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 17);


-- Process: TSP-13:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{безопасность оборудования и активов вне территории, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4}', NULL, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько активов организации подлежит страхованию?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 18);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 18);


-- Process: TSP-14:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда осуществляется пересмотр модели угроз ИБ?', '{ежегодно, раз в два года, раз в три года, не проходит}', '{5, 4, 3, 2}', NULL, 5, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 19);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 19);


-- Process: OSP-1:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз в год составляется доклад тактическому уровню об эффективности процессов?	', '{4, 3, 2, 1}', '{5, 4, 3, 2}', NULL, 5, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 3, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 20);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 20);


-- Process: OSP-2:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{политика ИБ в отношениях с поставщиками, цепочка поставок для информационно-коммуникационных технологий, не применяются}', NULL, '{1,2}', NULL, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Количество поставщиков с кем не согласованы требования по ОИБ?	', '{0, 1, 2, все}', '{5, 4, 3, 2}', NULL, 5, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 21);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 21);


-- Process: OSP-3:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{инвентаризация активов, владельцы активов, надлежащее использование активов, возврат активов, классификация информации, управление активами, управление съемными носителями, утилизация носителей информации, физическое перемещение носителей информации, безопасность оборудования и активов вне территории, безопасное списание или повторное использование оборудования, не применяются}', NULL, '{1,2,3,4,5,6,7,8,9,10,11}', NULL, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз осуществляется классификация активов?	', '{раз в год, 2 раза в год, 3 раза в год, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 3, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 0, 22);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 1, 22);


-- Process: OSP-4:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{политика ИБ в отношениях с поставщиками, цепочка поставок для информационно-коммуникационных технологий, не применяются}', NULL, '{1,2}', NULL, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда осуществляются изменения структурных компонентов ИТ-инфраструктуры?	', '{1 раз в год, 2 раза в год, 3 раза в год, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 2, 23);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 2, 23);


-- Process: OSP-5:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{контроль технических уязвимостей, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда осуществляются обновление структурных компонентов ИТ-инфраструктуры?	', '{1 раз в год, 2 раза в год, 3 раза в год, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 2, 24);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 2, 24);


-- Process: OSP-6:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{утилизация носителей информации, безопасное списание или повторное использование оборудования, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6,7}', NULL, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'С каких носителей происходит удаление информации?	', '{со всех носителей на утилизацию, 75%, 50%, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 2, 25);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 2, 25);


-- Process: OSP-7:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{безопасность оборудования и активов вне территории, контроль технических уязвимостей, безопасность прикладных сервисов в общедоступных сетях, защита транзакций прикладных сервисов, не применяются}', NULL, '{1,2,3,4}', NULL, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз проводится обследование на рациональное использование каналов, портов и интерфейсов?	', '{еженедельно, ежемесячно, раз в год, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 2, 26);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 2, 26);


-- Process: OSP-8:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{анализ и спецификация требований по ОИБ, безопасность прикладных сервисов в общедоступных сетях, разработка на аутсорсинге, не применяются}', NULL, '{1,2,3}', NULL, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз проводится проверка соответствия ИС требованиям по ОИБ?	', '{ежегодно, раз в два года, раз в три года, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 2, 27);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 2, 27);


-- Process: OSP-9:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько раз осуществляется мониторинг ИТ-инфраструктуры на целостность?	', '{еженедельно, ежемесячно, раз в год, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 2, 28);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 2, 28);


-- Process: OSP-10:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{резервное копирование информации, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько происшествий связанных с потерей информации в случае НШС?	', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 29);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 29);


-- Process: OSP-11:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{управление доступом, физические средства контроля за проходом, регистрация событий, защита записей, не применяются}', NULL, '{1,2,3,4}', NULL, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Как осуществляется контролирование разграничение доступа?	', '{в режиме реального времени, в конце дня, в случае инцидента, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 30);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 30);


-- Process: OSP-12:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{управление доступом, физические средства контроля за проходом, охраняемая территория, оборудование, не применяются}', NULL, '{1,2,3,4}', NULL, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Создание учетных записей осуществляется для каких сотрудников?	', '{100%, 75%, 50%, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 31);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 31);


-- Process: OSP-14:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{охраняемая территория, оборудование, не применяются}', NULL, '{1,2}', NULL, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Как осуществляется контролирование элементов ИТ-инфраструктуры от воздействия физических угроз?	', '{в режиме реального времени, в конце дня, в случае инцидента, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 32);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 32);


-- Process: OSP-15:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{непрерывность ИБ, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда отслеживается непрерывность процессов СУИБ?	', '{в реальном времени, в конце дня, в конце недели, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 33);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 33);


-- Process: OSP-16:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{управления сетевой безопасностью, анализ и спецификация требований по ОИБ, безопасность прикладных сервисов в общедоступных сетях, не применяются}', NULL, '{1,2,3}', NULL, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда осуществляется фильтрация входящих пакетов?	', '{в реальном времени, ежечасно, раз в день, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 34);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 34);


-- Process: OSP-17:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{средства защиты от вредоностного кода, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда отслеживается непрерывность процессов СУИБ?	', '{в реальном времени, в конце дня, в конце недели, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 35);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 35);


-- Process: OSP-19:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{пересмотр пользовательских прав доступа, управление аудитом ИС, регистрация событий, анализ технического соответствия, не применяются}', NULL, '{1,2,3,4,5}', NULL, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда проходит внутренний технический контроль?	', '{ежемесячно, раз в полгода, раз в год, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 36);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 36);


-- Process: OSP-20:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{проверка, анализ и оценка непрерывности ИБ, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Тестирование систем защиты на проникновение?	', '{ежемесячно, раз в полгода, раз в год, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 37);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 37);


-- Process: OSP-21:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда проходит пересмотр информации ограниченного доступа	', '{ежемесячно, раз в полгода, раз в год, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 38);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 38);


-- Process: OSP-22:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{сообщение о событиях ИБ, сообщение об уязвимостях в ИБ, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6,7}', NULL, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Когда проходит проверка реагирования на инциденты?	', '{ежемесячно, раз в полгода, раз в год, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 39);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 39);


-- Process: OSP-23:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{логирование, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Как осуществляется процедура логирования?	', '{в режиме реального времени, раз в час, в конце дня, не осуществляется}', '{5, 4, 3, 2}', NULL, 5, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 40);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 40);


-- Process: OSP-24:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{контакты с профессиональными сообществами, учет опыта инцидентов ИБ, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6,7}', NULL, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько успешно обработанных инцидентов ИБ?	', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 41);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 41);


-- Process: OSP-25:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{сбор свидетельств, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько успешно расследованных инцидентов ИБ?	', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 42);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 42);


-- Process: OSP-26:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько проводится проверок технического оборудования?	', '{1, 2, 3, 4}', '{5, 4, 3, 2}', NULL, 5, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 43);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 43);


-- Process: OSP-27:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{защита записей, аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5,6}', NULL, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Как часто проводится мониторинг базы информации в год?	', '{4, 3, 2, 1}', '{5, 4, 3, 2}', NULL, 5, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 44);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 44);


-- Process: OSP-28:
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Определена ли цель процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Разработаны ли регламентирующие документы процесса системы управления информационной безопасности?', '{Да, Нет}', NULL, '{1}', NULL, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Какие средства управления применяются для процесса системы управления информационной безопасности?', '{аудит, тестирование, мониторинг, оценка, оптимизация, не применяются}', NULL, '{1,2,3,4,5}', NULL, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Как часто проводится проверка внешних источников информации?	', '{4, 3, 2, 1}', '{5, 4, 3, 2}', NULL, 5, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько ИА удается восстановить после  реализации угроз?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько используется процессом ресурсов из доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 4, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько задач решается процессов с использованием доступных ресурсов?', '{100%, 75%, 50%, 25%}', '{5, 4, 3, 2}', NULL, 5, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Оцените финансовые затраты на процесс?', '{0, 25, 50, 75}', '{5, 4, 3, 2}', NULL, 5, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие ISO 27000?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько несоответствия выявлено в ходе аудита на соответствие отраслевым требования?', '{0, 1, 2, 3}', '{5, 4, 3, 2}', NULL, 5, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Сколько тратиться времени на устранения нештатной ситуации(минуты)?', '{20, 40, 60, 80}', '{5, 4, 3, 2}', NULL, 5, 45);
INSERT INTO questions(id, name, variants, marks, correct_answers, weight, process_id) VALUES (DEFAULT, 'Каков интервал между созданиями резервных копий(минуты)?', '{2, 10, 30, 60}', '{5, 4, 3, 2}', NULL, 5, 45);