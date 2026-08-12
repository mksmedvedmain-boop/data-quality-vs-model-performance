# The Influence of Data Quality on Machine Learning Model Accuracy

![Python](https://img.shields.io/badge/Python-3.x-3776AB?logo=python&logoColor=white)
![scikit-learn](https://img.shields.io/badge/scikit--learn-modeling-F7931E?logo=scikit-learn&logoColor=white)
![Status](https://img.shields.io/badge/status-in%20progress-D4A72C)

## Research Overview

This repository contains a research project investigating how data quality affects the performance of machine learning models. Using the Titanic dataset, the study examines whether changes to the data have a greater effect on predictive performance than the choice of algorithm.

The research focuses on three data-quality factors:

- Missing data
- Feature selection
- Label noise

Three classification algorithms are evaluated under these conditions:

- Logistic Regression
- Decision Tree
- Random Forest

The project is intended as a reproducible research record and as part of an academic portfolio. Results reported here reflect the current state of the experiments and may be extended as the study progresses.

## Research Question

> To what extent does data quality affect the accuracy of machine learning models compared to the choice of algorithm?

## Hypothesis

> Data quality has a greater influence on the performance of machine learning models than the choice of algorithm.

The hypothesis remains subject to the final comparison of all experimental results. This repository does not treat the hypothesis as confirmed before that analysis is complete.

## Objectives

1. Measure the effect of missing data on model performance.
2. Examine how different feature sets affect predictive performance.
3. Investigate the effect of label noise on classification results.
4. Compare Logistic Regression, Decision Tree, and Random Forest models under consistent experimental conditions.
5. Evaluate the relative influence of data quality and algorithm choice.
6. Document the methodology so that the experiments can be reproduced and extended.

## Dataset

The experiments use the Titanic dataset, a commonly used binary-classification dataset in which the target variable represents passenger survival.

The preprocessing workflow is designed to support controlled experiments involving:

- Missing-value conditions
- Different feature subsets
- Controlled label-noise levels
- Consistent training and evaluation procedures

## Machine Learning Models

| Model | Role in the study |
| --- | --- |
| Logistic Regression | Linear baseline classifier |
| Decision Tree | Single-tree, non-linear classifier |
| Random Forest | Ensemble classifier based on multiple decision trees |

## Experiments

### 1. Missing Data Experiment

Model performance is evaluated after introducing different proportions of missing values:

- 0% missing data
- 10% missing data
- 20% missing data
- 30% missing data

### 2. Feature Selection Experiment

The study compares progressively broader feature sets:

- Basic features
- Extended features
- All available features

### 3. Label Noise Experiment

The target labels are evaluated under controlled noise levels:

- 0% noise
- 10% noise
- 20% noise
- 30% noise

### 4. Model Comparison

The results from the data-quality experiments are compared across the three algorithms to separate the effect of data quality from the effect of model choice.

## Evaluation Metrics

The models are evaluated using:

- Accuracy
- Precision
- Recall
- F1-score
- Confusion matrix

No single metric is treated as sufficient on its own. Accuracy is considered alongside precision, recall, F1-score, and confusion matrices to provide a more complete view of classification performance.

## Technologies

- Python 3.x
- pandas
- NumPy
- Matplotlib
- scikit-learn
- Google Colab or another Jupyter-compatible environment
- GitHub

## Project Structure

The repository currently contains the following main areas:
```
data-quality-vs-model-performance/
├── datasets/       # Dataset files
├── images/         # Generated plots and visualizations
├── notebooks/      # Experiment notebooks
```
```
├── results/        # Experimental result files
├── report/         # Research paper and supporting documents
├── src/            # Reusable Python modules as the project develops
├── requirements.txt
└── README.md
```
The structure above describes the current repository organization. Additional reusable modules, documentation, and analysis outputs may be added as the research develops.

## Methodology Overview

The experimental workflow follows these stages:

1. Load the Titanic dataset.
2. Inspect and preprocess the data.
3. Define the feature sets and target variable.
4. Train Logistic Regression, Decision Tree, and Random Forest models.
5. Create controlled missing-data, feature-selection, and label-noise conditions.
6. Evaluate each model using the selected metrics.
7. Store results and generate visualizations.
8. Compare the effect of data-quality changes with the differences between algorithms.

To support a fair comparison, the experimental conditions should use consistent preprocessing, train-test splitting, and evaluation procedures wherever applicable.

## Results

The current repository reports the following model-comparison values:

| Model | Accuracy | Precision | Recall | F1-score |
| --- | ---: | ---: | ---: | ---: |
| Logistic Regression | 0.816 | Not reported | Not reported | Not reported |
| Decision Tree | 0.821 | Not reported | Not reported | Not reported |
| Random Forest | 0.827 | 0.877 | 0.676 | 0.763 |

The following experiment areas are currently represented in the repository:

- Missing data
- Noisy labels
- Feature selection
- Model comparison

Visualizations are available in [`images/`](./images), and tabular outputs are stored in [`results/`](./results).

These values are a current snapshot of the project rather than a final statistical conclusion. The complete interpretation of the research question depends on the final cross-condition comparison and analysis.

## Research Status

### Completed or currently represented

- Data preprocessing
- Missing-data experiments
- Label-noise experiments
- Feature-selection experiments
- Model comparison
- Result visualizations

### Planned or in progress

- Hyperparameter tuning
- Cross-validation
- Final research report
- Consolidated interpretation of the hypothesis

## Future Work

Potential extensions include:

- Hyperparameter optimization
- Cross-validation and repeated evaluation
- ROC curve analysis
- Precision-recall curve analysis
- Feature-importance analysis
- Evaluation of additional algorithms, such as XGBoost and LightGBM
- More formal statistical comparison of the effects of data quality and model choice

## Reproducibility / How to Run

### 1. Clone the repository
```
git clone https://github.com/mksmedvedmain-boop/data-quality-vs-model-performance.git
cd data-quality-vs-model-performance
```
### 2. Create an isolated Python environment
```
python -m venv .venv
```
Activate the environment:
```
# macOS/Linux
source .venv/bin/activate

# Windows PowerShell
.venv\Scripts\Activate.ps1
```
### 3. Install dependencies
```
pip install -r requirements.txt
```
### 4. Run the experiments

The experiments are provided as Jupyter/Google Colab notebooks in [`notebooks/`](./notebooks). Open the relevant notebook, verify the dataset path, and run the cells in order.
For a local Jupyter environment:
```
jupyter notebook
```
Generated tables should be stored in [`results/`](./results), while plots and other visual outputs should be stored in [`images/`](./images).

## Author

Ivan Medvedev

Student researcher interested in machine learning, artificial intelligence, and data science.

## License

This repository is intended for academic and educational research. A formal license should be added if the project is distributed for reuse beyond the current research context.

---

This project studies the relationship between data quality and machine learning performance through controlled experiments. Its current status is ongoing, and conclusions will be updated as the remaining analyses are completed.
