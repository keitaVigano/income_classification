# Exploring Socio-Demographic Patterns in Income Classification Using Machine Learning

This project develops a predictive model to classify individuals earning over $50K annually using the 1994 U.S. Census dataset. The primary objective is to analyze socio-economic factors influencing income levels and construct a robust machine learning workflow, leveraging KNIME.

The report outlines a structured and systematic approach, focusing on preprocessing, feature engineering, model training, and evaluation, to ensure reliable and interpretable results.


## Dataset

The dataset is derived from the 1994 U.S. Census Bureau database and includes 14 features and one target variable (`income`), categorized as either `>50K` or `<=50K`. Features include socio-demographic and economic variables such as age, education, marital status, and occupation.

Key statistics:
- **Size:** 32,561 rows
- **Target variable distribution:** 76% `<=50K` and 24% `>50K`

---

## Objectives

1. **Preprocessing:** Handle missing values, perform feature engineering, and address class imbalance.
2. **Model Training:** Train multiple machine learning models with tailored preprocessing steps.
3. **Evaluation:** Evaluate model performance using ROC-AUC for threshold-independent comparisons.
4. **Threshold Optimization:** Optimize the classification threshold to maximize accuracy and sensitivity.
5. **Feature Importance Analysis:** Assess global feature importance using the `total gain` metric from XGBoost and explore individual-level contributions with SHAP.

---

## Workflow and Tools

The project was developed primarily in **KNIME**, a user-friendly tool for building machine learning workflows. Python was used secondarily for supplementary analysis and experiments. The **KNIME workflow** represents the definitive and correct implementation of the analysis and is fully documented in the accompanying report.

### Highlights of the Workflow:
- **Comprehensive Preprocessing:**
  - Addressing missing values (e.g., workclass and native country).
  - Grouping categorical variables (e.g., education levels and native countries) for better interpretability.
  - Balancing the dataset through undersampling.

- **Model Training:**
  - Logistic Regression, Random Forest, Gradient Boosting, XGBoost, and ensemble methods like Stacking.
  - Hyperparameter tuning using 10-fold cross-validation with sensitivity as the primary metric.

- **Evaluation:**
  - ROC curves to assess performance without threshold dependency.
  - Threshold optimization for the best-performing XGBoost model to maximize accuracy and sensitivity.

- **Feature Importance:**
  - Using XGBoost’s `total gain` to evaluate the global contribution of features.
  - Key drivers identified include:
    - **Marital status (Married-civ-spouse):** Reflecting economic stability in dual-income households.
    - **Capital gain:** Indicating higher investment income correlates with higher earnings.
    - **Education (education.num):** Highlighting the critical role of advanced education levels.

---

## Results

- **Best Model:** XGBoost
- **Performance Metrics at Optimal Threshold:**
  - **Accuracy:** 83.95%
  - **Sensitivity:** 89.81%
  - **Specificity:** 78.16%
  - **Precision:** 80.44%
- **Global Feature Importance:**
  - The most important features influencing income predictions include marital status, capital gains, and education levels.

---

## How to Use

### KNIME Workflow
The **KNIME workflow** provides the full and correct implementation of the analysis. Open the workflow in KNIME Analytics Platform to explore the end-to-end process, from preprocessing to model evaluation.

### Python Scripts
For supplementary analysis, use the Python scripts provided in the `notebook` directory.
