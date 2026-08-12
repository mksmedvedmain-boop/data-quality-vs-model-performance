# Notebooks

The notebooks contain the experimental workflow for the project.

## Recommended execution order

### Baseline models

1. `01_logistic_regression.ipynb`
2. `02_decision_tree.ipynb`
3. `03_random_forest.ipynb`

### Main data-quality experiments

4. `04_missing_data.ipynb`
5. `05_noisy_data.ipynb`
6. `06_feature_selection.ipynb`

### Main comparisons

7. `07_data_quality_comparison.ipynb`
8. `17_overall_model_comparison.ipynb`

## Detailed experiments

The notebooks from `08` to `16` contain model-specific experiments for:

- missing data;
- label noise;
- feature selection;
- model comparisons.

They are preserved as supporting research material.

## Reproducibility

The current experiments use:

- test size: `0.2`;
- random state: `42`.

The notebooks should be executed from the repository root or with paths configured consistently.

Generated result tables belong in `results/`.

Generated figures belong in `images/`.
