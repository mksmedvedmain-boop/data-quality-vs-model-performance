<div align="center">

# Data Quality vs. Model Performance

### A reproducible machine-learning study of how information quality shapes classification results

<p>
  <a href="https://www.python.org/"><img src="https://img.shields.io/badge/Python-3.x-3776AB?logo=python&logoColor=white" alt="Python 3.x"></a>
  <a href="https://scikit-learn.org/"><img src="https://img.shields.io/badge/scikit--learn-modeling-F7931E?logo=scikit-learn&logoColor=white" alt="scikit-learn"></a>
  <a href="https://jupyter.org/"><img src="https://img.shields.io/badge/Jupyter-reproducible%20experiments-F37626?logo=jupyter&logoColor=white" alt="Jupyter"></a>
  <a href="./results/"><img src="https://img.shields.io/badge/results-8%20CSV%20tables-16A085" alt="Eight result tables"></a>
  <a href="./images/"><img src="https://img.shields.io/badge/figures-8%20visualizations-8E44AD" alt="Eight visualizations"></a>
</p>

<p>
  <strong>Can a strong algorithm compensate for weak data?</strong><br>
  This project tests that question through controlled experiments on the Titanic survival dataset.
</p>

<p>
  <a href="#key-findings">Key findings</a> ·
  <a href="#visual-results">Visual results</a> ·
  <a href="#reproduce-the-study">Reproduce the study</a> ·
  <a href="#research-roadmap">Research roadmap</a>
</p>

</div>

---

## Why this project matters

Machine-learning discussions often focus on choosing the “best” algorithm. In practice, a model cannot recover information that is missing, irrelevant, or incorrectly labeled. This study isolates three data-quality factors and measures how they change the performance of three structurally different classifiers.

The project is designed as a transparent research portfolio: every headline result in this README is traceable to a CSV file in [`results/`](./results), and every figure is linked to a real image in [`images/`](./images). The goal is not to make an exaggerated claim, but to show a complete, reproducible analytical workflow.

## Research question

> **To what extent does data quality affect classification performance compared with the choice of algorithm?**

### Hypothesis

> **Data quality has a greater influence on model performance than algorithm choice.**

The current results strongly support continuing to test this hypothesis, especially because label noise produces much larger performance changes than the missing-data conditions in this repository. A final academic conclusion should still include repeated evaluation, cross-validation, and statistical uncertainty.

## Key findings

<table>
  <tr>
    <td width="33%" valign="top">
      <h3>Label noise is the largest stress test</h3>
      At 30% label noise, accuracy falls from <strong>0.810 to 0.196</strong> for Logistic Regression, a <strong>0.614</strong> decrease.
    </td>
    <td width="33%" valign="top">
      <h3>Missing data has a smaller effect here</h3>
      From 0% to 30% missing data, Random Forest accuracy changes from <strong>0.821 to 0.782</strong>, a <strong>0.039</strong> decrease.
    </td>
    <td width="33%" valign="top">
      <h3>More features help tree models</h3>
      With all features, Decision Tree accuracy rises from <strong>0.631 to 0.782</strong> and Random Forest accuracy rises from <strong>0.721 to 0.821</strong>.
    </td>
  </tr>
</table>

### All-features reference values

The `All Features` rows in the feature-selection results provide a consistent reference point for the three models:

| Model | Accuracy | F1-score | Evidence |
| --- | ---: | ---: | --- |
| Logistic Regression | 0.810 | 0.764 | [`feature_selection_accuracy.csv`](./results/feature_selection_accuracy.csv) · [`feature_selection_f1.csv`](./results/feature_selection_f1.csv) |
| Decision Tree | 0.782 | 0.742 | [`feature_selection_accuracy.csv`](./results/feature_selection_accuracy.csv) · [`feature_selection_f1.csv`](./results/feature_selection_f1.csv) |
| Random Forest | **0.821** | **0.778** | [`feature_selection_accuracy.csv`](./results/feature_selection_accuracy.csv) · [`feature_selection_f1.csv`](./results/feature_selection_f1.csv) |

These values are not presented as a universal leaderboard. They are the scores produced by the current experiment setup and should be interpreted together with the condition under which each result was generated.

## Study at a glance

| Dimension | Design |
| --- | --- |
| Dataset | Titanic passenger survival dataset |
| Task | Binary classification |
| Models | Logistic Regression, Decision Tree, Random Forest |
| Data-quality factors | Missing data, feature selection, label noise |
| Missing-data levels | 0%, 10%, 20%, 30% |
| Label-noise levels | 0%, 10%, 20%, 30% |
| Feature configurations | Basic, extended, all features |
| Metrics | Accuracy and F1-score, supported by visual comparisons |
| Experiment outputs | 8 CSV tables and 8 PNG figures |
| Research status | Reproducible baseline complete; extended validation is next |

## Experimental design

### 1. Missing data

Increasing proportions of missing values are introduced and the same models are evaluated under each condition:

`0% → 10% → 20% → 30%`

The available results show a comparatively moderate change in this setup. At 30% missing data, Random Forest accuracy is 0.782 and F1-score is 0.727, compared with 0.821 and 0.778 at 0%.

### 2. Feature selection

The study compares progressively richer feature configurations:

`Basic Features → Extended Features → All Features`

The largest gains appear for the tree-based models. Decision Tree F1-score improves from 0.522 to 0.742, while Random Forest F1-score improves from 0.643 to 0.778.

### 3. Label noise

Controlled noise is added to the target labels:

`0% → 10% → 20% → 30%`

This is the strongest degradation pattern in the current outputs. At 20% noise, accuracy reaches 0.196 for Logistic Regression, 0.223 for Decision Tree, and 0.184 for Random Forest. At 30%, the scores remain substantially below the clean baseline.

### 4. Model comparison

The three models represent different modeling assumptions:

| Model | Role in the study |
| --- | --- |
| Logistic Regression | Interpretable linear baseline |
| Decision Tree | Interpretable non-linear model |
| Random Forest | Ensemble of decision trees |

Comparing these models under the same data-quality conditions helps separate the effect of the algorithm from the effect of the information supplied to it.

## Results

All tables below are generated outputs already present in [`results/`](./results).

| Experiment | Accuracy data | F1-score data |
| --- | --- | --- |
| Missing data | [`missing_data_accuracy.csv`](./results/missing_data_accuracy.csv) | [`missing_data_f1.csv`](./results/missing_data_f1.csv) |
| Label noise | [`label_noise_accuracy.csv`](./results/label_noise_accuracy.csv) | [`label_noise_f1.csv`](./results/label_noise_f1.csv) |
| Feature selection | [`feature_selection_accuracy.csv`](./results/feature_selection_accuracy.csv) | [`feature_selection_f1.csv`](./results/feature_selection_f1.csv) |
| Overall comparison | [`overall_accuracy.csv`](./results/overall_accuracy.csv) | [`overall_f1.csv`](./results/overall_f1.csv) |

### Interpretation of the current outputs

- **Label noise has the clearest negative relationship with performance.** At 30% noise, Logistic Regression loses 0.614 accuracy points and Random Forest loses 0.558 points compared with their 0% rows.
- **Missing data is less damaging in the measured range.** Random Forest accuracy decreases by 0.039 points and F1-score by 0.051 points between 0% and 30% missing data.
- **Feature selection is especially important for tree-based models.** Moving from the basic to the all-feature configuration improves Decision Tree accuracy by 0.151 and Random Forest accuracy by 0.100.
- **Metric choice matters.** Accuracy and F1-score generally move in the same direction, but their magnitudes differ; both should be reviewed before drawing a conclusion.

### Complete values from the result files

The tables below reproduce every numeric value currently stored in [`results/`](./results). No result cell is estimated, inferred, or left blank.

#### Missing-data experiment

**Accuracy**

| Missing data | Logistic Regression | Decision Tree | Random Forest |
| --- | ---: | ---: | ---: |
| 0% | 0.810 | 0.782 | 0.821 |
| 10% | 0.777 | 0.810 | 0.799 |
| 20% | 0.765 | 0.793 | 0.782 |
| 30% | 0.765 | 0.788 | 0.782 |

**F1-score**

| Missing data | Logistic Regression | Decision Tree | Random Forest |
| --- | ---: | ---: | ---: |
| 0% | 0.764 | 0.742 | 0.778 |
| 10% | 0.730 | 0.773 | 0.757 |
| 20% | 0.724 | 0.745 | 0.738 |
| 30% | 0.724 | 0.725 | 0.727 |

#### Label-noise experiment

**Accuracy**

| Label noise | Logistic Regression | Decision Tree | Random Forest |
| --- | ---: | ---: | ---: |
| 0% | 0.810 | 0.782 | 0.821 |
| 10% | 0.469 | 0.531 | 0.480 |
| 20% | 0.196 | 0.223 | 0.184 |
| 30% | 0.196 | 0.352 | 0.263 |

**F1-score**

| Label noise | Logistic Regression | Decision Tree | Random Forest |
| --- | ---: | ---: | ---: |
| 0% | 0.764 | 0.742 | 0.778 |
| 10% | 0.410 | 0.500 | 0.422 |
| 20% | 0.182 | 0.240 | 0.170 |
| 30% | 0.182 | 0.383 | 0.258 |

#### Feature-selection experiment

**Accuracy**

| Feature set | Logistic Regression | Decision Tree | Random Forest |
| --- | ---: | ---: | ---: |
| Basic Features | 0.810 | 0.631 | 0.721 |
| Extended Features | 0.810 | 0.749 | 0.810 |
| All Features | 0.810 | 0.782 | 0.821 |

**F1-score**

| Feature set | Logistic Regression | Decision Tree | Random Forest |
| --- | ---: | ---: | ---: |
| Basic Features | 0.761 | 0.522 | 0.643 |
| Extended Features | 0.757 | 0.698 | 0.764 |
| All Features | 0.764 | 0.742 | 0.778 |

#### Overall comparison

**Accuracy**

| Experiment | Logistic Regression | Decision Tree | Random Forest |
| --- | ---: | ---: | ---: |
| Missing Data | 0.765 | 0.788 | 0.782 |
| Label Noise | 0.196 | 0.352 | 0.263 |
| Feature Selection | 0.810 | 0.782 | 0.821 |

**F1-score**

| Experiment | Logistic Regression | Decision Tree | Random Forest |
| --- | ---: | ---: | ---: |
| Missing Data | 0.724 | 0.725 | 0.727 |
| Label Noise | 0.182 | 0.383 | 0.258 |
| Feature Selection | 0.764 | 0.742 | 0.778 |

## Visual results

The gallery uses only the PNG files that currently exist in [`images/`](./images). Click any figure to open the full-size image.

### Overall comparisons

| Accuracy across experiment families | F1-score across experiment families |
| --- | --- |
| [![Overall accuracy comparison](./images/comparison_accuracy.png)](./images/comparison_accuracy.png) | [![Overall F1-score comparison](./images/comparison_f1.png)](./images/comparison_f1.png) |

### Missing-data analysis

| Accuracy | F1-score |
| --- | --- |
| [![Accuracy under missing data](./images/overall_missing_data_accuracy.png)](./images/overall_missing_data_accuracy.png) | [![F1-score under missing data](./images/overall_missing_data_f1.png)](./images/overall_missing_data_f1.png) |

### Label-noise analysis

| Accuracy | F1-score |
| --- | --- |
| [![Accuracy under label noise](./images/overall_label_noise_accuracy.png)](./images/overall_label_noise_accuracy.png) | [![F1-score under label noise](./images/overall_label_noise_f1.png)](./images/overall_label_noise_f1.png) |

### Feature-selection analysis

| Accuracy | F1-score |
| --- | --- |
| [![Accuracy under feature selection](./images/overall_feature_selection_accuracy.png)](./images/overall_feature_selection_accuracy.png) | [![F1-score under feature selection](./images/overall_feature_selection_f1.png)](./images/overall_feature_selection_f1.png) |

## Methodology

The notebooks follow a consistent experimental sequence:

1. Load the Titanic dataset from [`datasets/Titanic-Dataset.csv`](./datasets/Titanic-Dataset.csv).
2. Inspect and preprocess the input data.
3. Define the feature sets and target variable.
4. Train Logistic Regression, Decision Tree, and Random Forest models.
5. Create controlled missing-data, feature-selection, and label-noise conditions.
6. Evaluate accuracy and F1-score.
7. Save result tables to [`results/`](./results).
8. Generate figures in [`images/`](./images).
9. Compare changes caused by data quality with differences between models.

For a fair comparison, preprocessing, train-test splitting, and evaluation procedures should remain consistent across comparable experiments.

## Repository structure

```text
data-quality-vs-model-performance/
├── datasets/
│   └── Titanic-Dataset.csv
├── images/
│   ├── comparison_accuracy.png
│   ├── comparison_f1.png
│   ├── overall_feature_selection_*.png
│   ├── overall_label_noise_*.png
│   └── overall_missing_data_*.png
├── notebooks/
│   ├── 01_logistic_regression.ipynb
│   ├── 02_decision_tree.ipynb
│   ├── 03_random_forest.ipynb
│   └── 04–17_experiment_notebooks.ipynb
├── results/
│   ├── feature_selection_*.csv
│   ├── label_noise_*.csv
│   ├── missing_data_*.csv
│   └── overall_*.csv
├── report/
├── src/
├── requirements.txt
└── README.md
```

## Reproduce the study

### Clone the repository

```bash
git clone https://github.com/mksmedvedmain-boop/data-quality-vs-model-performance.git
cd data-quality-vs-model-performance
```

### Create and activate a virtual environment

```bash
python -m venv .venv
```

macOS/Linux:

```bash
source .venv/bin/activate
```

Windows PowerShell:

```powershell
.venv\Scripts\Activate.ps1
```

### Install dependencies

```bash
pip install -r requirements.txt
```

### Run the notebooks

Open the relevant notebook from [`notebooks/`](./notebooks) in Google Colab or Jupyter. Run cells in order and confirm that the dataset path points to [`datasets/Titanic-Dataset.csv`](./datasets/Titanic-Dataset.csv).

To start Jupyter locally:

```bash
jupyter notebook
```

The expected outputs are CSV tables in [`results/`](./results) and PNG figures in [`images/`](./images).

## Research roadmap

The current repository provides a complete baseline for the three planned data-quality comparisons. The next steps are:

- Add repeated train-test splits and k-fold cross-validation.
- Report means, standard deviations, and confidence intervals.
- Add ROC and precision-recall curves.
- Measure feature importance and model stability.
- Tune model hyperparameters under a fixed evaluation protocol.
- Compare additional algorithms, such as gradient boosting, with the same controls.
- Write a formal report with limitations, threats to validity, and a final hypothesis assessment.

## Technologies

`Python` · `pandas` · `NumPy` · `Matplotlib` · `scikit-learn` · `Jupyter Notebook` · `Google Colab` · `GitHub`

## Author

**Ivan Medvedev**  
Student researcher interested in machine learning, artificial intelligence, and data science.

## License and academic use

This repository is intended for academic and educational research. A formal open-source license can be added if the project is later distributed for broader reuse.

---

<div align="center">
  <strong>Better models start with better questions about the data.</strong><br>
  <sub>This project is an ongoing research record; conclusions will be refined as validation becomes more rigorous.</sub>
</div> 
