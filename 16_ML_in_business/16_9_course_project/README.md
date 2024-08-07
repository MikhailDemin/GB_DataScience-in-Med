Курсовой проект по курсу "Машинное обучение в бизнесе"

Определение вероятности наличия сердечно-сосудистых заболеваний по данным первичного осмотра.
Нужно предсказать наличие сердечно-сосудистых заболеваний по результатам классического врачебного осмотра. Датасет сформирован из 70.000 реальных клинических анализов, и в нём используются признаки, которые можно разбить на 3 группы:__
**Объективные признаки:**

 - Возраст
 - Рост
 - Вес
 - Пол

**Результаты измерения:**

 - Артериальное давление верхнее и нижнее
 - Холестерин
 - Глюкоза

**Субъективные признаки:**

 - Курение
 - Употребление Алкоголя
 - Физическая активность

Возраст дан в днях. Значения показателей холестерина и глюкозы представлены одним из трех классов: норма, выше нормы, значительно выше нормы. Значения субъективных признаков — бинарны.

Все показатели даны на момент осмотра.  

**Таргет** - наличие сердечно-сосудистых заболеваний (ССЗ)



__Проектная группа:__

**Марина Дружинина**
**Михаил Демин**
**Марат Закиров**
**Мгер Парунакян**

Описание:
Аналитика, очистка данных, построение модели приведено в ноутбуке - `app\models\course_project_ML_in_business.ipynb`
Датасет - `app\models\CV_case_set.csv`
Модель - `app\models\Catboost_pipeline.pkl`
Серверная часть - `app\run_server.py`
Клиентская часть - `app\PY Client POST.ipynb`