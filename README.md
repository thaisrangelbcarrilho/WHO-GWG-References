<div align="center">
	
# The World Health Organization Gestational Weight Gain References: Construction of the Centile Curves

## Converting GWG (kg) into z-scores and percentiles using the GAMLSS-SST distribution

</div>

The **GAMLSS-SST** model/distribution was selected to construct the WHO gestational weight gain (GWG) centile curves. For each pre-pregnancy body mass index (BMI) category, a set of distribution parameters (**μ, σ, ν, and τ**) was extracted according to gestational age, from **8 to 41 weeks**. Based on these reference tables, it is possible to calculate an individual's exact **z-score and percentile** for gestational weight gain (kg). The functions provided in this repository can also be used to calculate z-scores and percentiles for an entire dataset.

## Important notes

### 1. Gestational age range
Z-scores and percentiles can only be calculated for gestational ages between **8 and 41 weeks**.
For weight gain measurements taken **before 8 weeks or after 41 weeks**, it is not possible to calculate a z-score or percentile or to classify the individual using the WHO GWG curves.

### 2. Obesity categories
Reference values are available for:
- **Obesity (all classes combined)**
- **Obesity class I**
- **Obesity class II**
- **Obesity class III**

> **Important:** For obesity classes II and III, only **unweighted centiles and distribution parameters (moments)** are provided.

### 3. Required variables
When applying the functions to calculate a z-score or percentile for an individual or a dataset, please ensure that the input variables are correctly formatted.

The minimum set of variables required for the functions to work is:

| Variable | Description |
|---|---|
| **Pre-pregnancy BMI category** | Pre-pregnancy BMI (kg/m²) classified according to the WHO 1995/2000 cut-offs |
| **Gestational weight gain (GWG)** | GWG in kg, calculated as the difference between weight measured at the antenatal care visit and pre-pregnancy weight |
| **Gestational age (GA)** | Gestational age at the antenatal care visit, in weeks, rounded to a maximum of two decimal places |

## Example

Consider a pregnant woman with:
- a pre-pregnancy BMI of **22.0 kg/m²**, corresponding to the **normal-weight** category;
- a gestational weight gain of **12.5 kg**; and
- a gestational age of **40.0 weeks**.

When the functions are applied to these values, the resulting estimates are:

| Measure | Result |
|---|---:|
| **Z-score** | 0.0227 |
| **Percentile** | 50.9 |

## Questions or issues
If you encounter any issues with the functions or have questions about the calculation of z-scores or percentiles, please contact:
**Thais Rangel Bousquet Carrilho**  
📧 [thaisrbcarriho@gmail.com](mailto:thaisrbcarriho@gmail.com)
