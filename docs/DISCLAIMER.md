# DRISHTI — Project Disclaimer

## 1. Purpose of This Project

**DRISHTI — Explainable AI for Diabetic Retinopathy Screening in Rural India** is an academic and research-oriented prototype developed for **Smart India Hackathon 2026, Problem Statement SIH26038**.

The prototype demonstrates how image quality assessment, retinal image processing, explainability, screening support, automated reporting, and rural telemedicine capacity modelling could be combined into a single workflow.

DRISHTI is intended for **demonstration, education, research, and prototype development purposes**.

---

## 2. Not a Medical Device

DRISHTI is **not a certified medical device** and should not be considered a clinically approved diagnostic system.

The prototype has not undergone the clinical, regulatory, safety, or certification processes required for deployment as a medical diagnostic product.

It must not be used as a substitute for:

* A qualified ophthalmologist
* A trained healthcare professional
* Clinical examination
* Laboratory or imaging investigations
* Professional medical diagnosis
* Professional treatment decisions

---

## 3. No Medical Diagnosis or Treatment

The screening results produced by the current prototype are intended only to demonstrate the proposed workflow.

DRISHTI does **not** provide definitive medical diagnosis or treatment recommendations.

Any actual patient assessment must be performed and interpreted by appropriately qualified healthcare professionals.

---

## 4. Prototype Classification Values

The current prototype can display example outputs such as:

* ICDR Grade 2
* Moderate Non-Proliferative Diabetic Retinopathy
* 87% confidence

These values are **demonstration outputs from the current prototype**.

They must **not** be interpreted as measured clinical accuracy, sensitivity, specificity, or validated model performance.

The displayed confidence value is not equivalent to a clinically calibrated probability.

---

## 5. Current Dataset Scope

The current prototype uses a subset of **100 PNG retinal images from the APTOS 2019 dataset** for demonstration and development.

The current prototype has **not** been clinically validated across multiple independent datasets.

The following datasets are identified for broader future evaluation:

* DRIVE
* IDRiD
* MESSIDOR-2

These datasets are part of the planned validation and development roadmap and should **not** be interpreted as datasets already evaluated by the current prototype.

---

## 6. Explainability Disclaimer

The current prototype demonstrates evidence visualization using image-processing-based evidence maps, including:

* Bright-region evidence
* Dark-region evidence
* Local-variation evidence
* Lesion/evidence reference visualization

These visualizations are intended to demonstrate the concept of explainable screening.

Advanced methods such as **Grad-CAM-based deep-learning explainability** are part of the planned future development and should not be represented as fully implemented clinical explainability in the current prototype.

---

## 7. Image Quality Assessment

The current image-quality gate uses prototype-level measurements such as:

* Focus/blur estimation
* Brightness/illumination analysis
* Dark-region analysis

These checks demonstrate how poor-quality retinal images could be identified before screening.

The current thresholds and measurements have **not been clinically validated** for universal fundus-camera or patient populations.

---

## 8. Simulink Capacity Model

The rural telemedicine component is a **simplified simulation model** intended to demonstrate system-level capacity concepts.

It represents factors such as:

* Incoming screening demand
* AI-assisted screening
* Human review capacity
* Remaining review workload
* Backlog behaviour
* Peak demand

The simulation parameters are prototype/demo assumptions and should not be interpreted as measured healthcare-system capacity or operational predictions.

---

## 9. No IoT Integration

The current DRISHTI prototype does **not** include an IoT-based hardware integration layer.

The project focuses on the software workflow involving:

**Fundus Image → Quality Gate → Screening → Explainability → Report → Capacity Simulation**

Future versions may investigate integration with suitable acquisition or telemedicine infrastructure, subject to technical and clinical requirements.

---

## 10. Patient Data and Privacy

The current repository is intended for development and demonstration using publicly available or permitted research data.

No personally identifiable patient information should be added to the repository.

Any future deployment involving real patient information would require appropriate:

* Data protection measures
* Access controls
* Secure storage
* Encryption
* Consent procedures where applicable
* Institutional approvals
* Applicable legal and regulatory compliance

---

## 11. Clinical Validation

Before any potential real-world clinical application, DRISHTI would require extensive validation, including evaluation on appropriately representative datasets and, where applicable:

* Clinical expert review
* External validation
* Sensitivity and specificity analysis
* Calibration assessment
* Robustness testing
* Bias and subgroup analysis
* Prospective clinical evaluation
* Human-AI workflow evaluation
* Appropriate regulatory and institutional review

No such clinical validation is claimed by the current prototype.

---

## 12. Human Oversight

Any future healthcare implementation should maintain qualified human oversight.

AI-generated screening information should be treated as **decision-support information**, not as an autonomous replacement for clinical judgement.

A future system should provide mechanisms for healthcare professionals to:

* Review screening results
* Inspect supporting evidence
* Override automated outputs
* Request additional examination
* Refer patients for appropriate clinical assessment

---

## 13. Research and Demonstration Status

The current implementation should be understood as a **proof-of-concept prototype** developed to demonstrate the feasibility of the proposed architecture.

The prototype is not intended to claim:

* Clinical diagnostic accuracy
* Regulatory approval
* Medical certification
* Deployment readiness
* Universal applicability
* Real-world healthcare performance

---

## 14. Future Development

Potential future development areas are documented in:

* [`docs/FUTURE_SCOPE.md`](FUTURE_SCOPE.md)
* [`docs/DATASETS.md`](DATASETS.md)
* [`docs/PROTOTYPE_WORKFLOW.md`](PROTOTYPE_WORKFLOW.md)
* [`docs/MATLAB_SIMULINK.md`](MATLAB_SIMULINK.md)
* [`docs/RESULTS.md`](RESULTS.md)

These documents distinguish the current prototype implementation from planned or future capabilities.

---

## 15. General Notice

The DRISHTI team makes no claim that the current prototype is suitable for direct clinical use.

Any use beyond academic demonstration or research would require substantial additional engineering, validation, clinical evaluation, cybersecurity assessment, privacy protection, regulatory review, and appropriate professional oversight.

**For academic, research, and demonstration purposes only.**

---

## Project Identification

**Project:** DRISHTI — Explainable AI for Diabetic Retinopathy Screening in Rural India
**SIH Problem Statement:** SIH26038
**Event:** Smart India Hackathon 2026
**Category:** Software
**Organization:** MathWorks
**Prototype Platform:** MATLAB + Simulink

---
