# DRISHTI — Future Scope

## 1. Overview

The current DRISHTI prototype establishes an academic foundation for:

* Quality-aware retinal image screening
* Explainable diabetic retinopathy assessment
* Automated screening reports
* Rural telemedicine capacity modelling

Future development can extend the prototype from a demonstration workflow toward a more robust, validated, and scalable research system.

```text
Current Prototype
       │
       ▼
Further Research & Development
       │
       ├── Better AI Models
       ├── Larger Datasets
       ├── Stronger Explainability
       ├── Clinical Validation
       ├── System Scalability
       └── Real-World Deployment Research
```

---

# 2. Future Development Roadmap

The proposed development path is:

```text
Prototype
   │
   ▼
Model Development
   │
   ▼
Multi-Dataset Evaluation
   │
   ▼
Explainability Enhancement
   │
   ▼
Clinical / Expert Validation
   │
   ▼
System-Level Validation
   │
   ▼
Potential Real-World Deployment
```

Each stage would require additional development and validation before moving to the next stage.

---

# 3. Advanced DR Classification

The current prototype uses an ICDR-style Grade 0–4 representation.

A future version could incorporate a trained deep-learning model for automated diabetic retinopathy classification.

Potential architecture:

```text
Fundus Image
     │
     ▼
Image Quality Model
     │
     ▼
Preprocessing
     │
     ▼
Deep Learning Model
     │
     ▼
DR Severity
     │
     ▼
Grade 0–4
```

The future model could be trained and evaluated using appropriately annotated retinal datasets.

---

# 4. Larger Dataset Evaluation

The current prototype uses exactly 100 APTOS 2019 PNG images.

Future evaluation can expand beyond this development subset.

Selected/planned datasets include:

* APTOS 2019
* DRIVE
* IDRiD
* MESSIDOR-2

Potential future evaluation structure:

```text
                    RETINAL DATA
                         │
          ┌──────────────┼──────────────┐
          │              │              │
          ▼              ▼              ▼
       APTOS           IDRiD        MESSIDOR-2
          │              │              │
          └──────────────┼──────────────┘
                         │
                         ▼
                   Evaluation
```

DRIVE can additionally support investigation of retinal vessel structures.

IDRiD can support research involving diabetic retinopathy and lesion-related annotations.

MESSIDOR-2 can support broader cross-dataset evaluation.

---

# 5. Robustness Across Datasets

A future research objective is to determine how well the screening approach generalizes across images collected under different conditions.

Potential evaluation areas include:

* Different cameras
* Different image resolutions
* Different illumination conditions
* Different patient populations
* Different acquisition environments
* Different dataset distributions

The objective would be to reduce dependence on a single dataset.

---

# 6. Improved Image Quality Assessment

The current quality gate uses prototype-level measures related to:

* Focus / blur
* Brightness
* Dark regions

A future version could use a dedicated trained image-quality model.

Potential workflow:

```text
Fundus Image
     │
     ▼
Quality Assessment Model
     │
 ┌───┴────┐
 │        │
Good     Poor
 │        │
 ▼        ▼
Process  Recapture
```

The future quality model could also identify additional problems such as:

* Incorrect field of view
* Excessive illumination
* Underexposure
* Obstructions
* Poor retinal coverage
* Camera artefacts

---

# 7. Automated Optic Disc and Fovea Localization

Future versions could automatically identify important retinal anatomical structures.

Potential workflow:

```text
Fundus Image
     │
     ▼
Retinal Structure Detection
     │
     ├── Optic Disc
     │
     └── Fovea
```

This could provide additional anatomical context for lesion analysis and explainability.

---

# 8. Automated Lesion Detection

A future version could identify diabetic retinopathy-related lesions such as:

* Microaneurysms
* Haemorrhages
* Exudates
* Neovascularisation

Potential workflow:

```text
Enhanced Fundus Image
          │
          ▼
    Lesion Detector
          │
   ┌──────┼────────┐
   │      │        │
   ▼      ▼        ▼
Micro-  Exudates  Haemorrhages
aneurysms
          │
          ▼
    Lesion Evidence
```

This would provide more specific evidence than the current prototype-level image-characteristic maps.

---

# 9. Lesion Segmentation

Beyond lesion detection, future research could investigate pixel-level or region-level segmentation.

Potential output:

```text
Fundus Image
     │
     ▼
Lesion Segmentation
     │
     ▼
Highlighted Lesion Regions
     │
     ▼
Quantitative Evidence
```

Appropriate expert-annotated datasets would be required for meaningful validation.

---

# 10. Grad-CAM Explainability

Grad-CAM is a planned future component of the DRISHTI system.

The intended workflow is:

```text
Fundus Image
     │
     ▼
Trained Deep Learning Model
     │
     ▼
DR Prediction
     │
     ▼
Grad-CAM
     │
     ▼
Important Image Regions
     │
     ▼
Human-Interpretable Explanation
```

The purpose would be to show which image regions influenced the model's prediction.

Grad-CAM is **not claimed as an implemented trained-model feature in the current prototype**.

---

# 11. Combined Explainability

Future versions could combine multiple evidence sources:

```text
                    DR Prediction
                         │
          ┌──────────────┼──────────────┐
          │              │              │
          ▼              ▼              ▼
       Grad-CAM      Lesion Maps    Anatomical
                                     Structures
          │              │              │
          └──────────────┼──────────────┘
                         │
                         ▼
                Combined Explanation
```

This could make the screening output easier for healthcare professionals to interpret.

---

# 12. Confidence Calibration

The current prototype displays a demonstration confidence value.

Future versions could implement calibrated confidence estimation.

Potential workflow:

```text
Model Prediction
       │
       ▼
Probability Calibration
       │
       ▼
Calibrated Confidence
       │
       ▼
Screening Report
```

This would require proper training, validation, and calibration experiments.

---

# 13. Referral Decision Support

A future system could support a structured referral workflow.

Conceptually:

```text
Screening Result
      │
      ▼
Severity + Evidence + Confidence
      │
      ▼
Referral Assessment
      │
 ┌────┴─────┐
 │          │
Routine   Specialist
Follow-up Referral
```

Such a workflow would need to be designed and validated with appropriate clinical expertise.

The system should support clinicians rather than replace them.

---

# 14. Improved Rural Telemedicine Simulation

The current Simulink model provides a simplified representation of:

* Incoming demand
* AI screening
* Human review
* Capacity
* Remaining work
* Backlog

Future versions could include:

```text
Variable Patient Arrival
          │
          ▼
     AI Screening
          │
          ▼
   Risk-Based Routing
      │          │
      ▼          ▼
Low Risk      Referable
                 │
                 ▼
          Specialist Queue
                 │
                 ▼
          Review Capacity
                 │
                 ▼
              Backlog
```

---

# 15. Multi-Center Simulation

Future Simulink models could represent multiple rural screening locations.

For example:

```text
Rural Center A ──┐
                 │
Rural Center B ──┼──► Regional Review Hub
                 │
Rural Center C ──┘
                         │
                         ▼
                  Specialist Review
```

This could allow investigation of how workload is distributed across different centers.

---

# 16. Network and Bandwidth Modelling

A future version could investigate the effect of network conditions on telemedicine workflows.

Potential variables include:

* Image transmission time
* Network bandwidth
* Communication delays
* Queueing delay
* Review turnaround time

Conceptually:

```text
Image Acquisition
       │
       ▼
Image Upload
       │
       ▼
Network
       │
       ▼
AI Screening
       │
       ▼
Remote Review
```

This would be particularly relevant to rural telemedicine research.

---

# 17. Privacy and Security

A future real-world implementation would require strong protection of patient information.

Potential areas include:

* Secure data transmission
* Access control
* Data encryption
* Patient identifiers
* Audit logging
* Secure storage
* Privacy-preserving workflows

These requirements would need to be addressed before any real-world deployment.

---

# 18. Clinical Validation

Clinical validation is one of the most important future stages.

A future validation program could involve:

```text
Retinal Dataset
      │
      ▼
AI Prediction
      │
      ▼
Expert Annotation
      │
      ▼
Comparison
      │
      ▼
Performance Evaluation
```

Potential evaluation metrics include:

* Sensitivity
* Specificity
* Precision
* Recall
* F1-score
* AUROC
* Confusion matrix
* Calibration

The current prototype does **not** provide these clinical validation results.

---

# 19. Expert-in-the-Loop Validation

Future development could include ophthalmologists or trained retinal specialists in the evaluation workflow.

Potential process:

```text
AI Screening
     │
     ▼
Evidence Visualization
     │
     ▼
Expert Review
     │
     ▼
Agreement / Disagreement
     │
     ▼
Model Evaluation
```

This could help evaluate both screening performance and explainability.

---

# 20. Human-AI Collaboration

The long-term objective is not to replace medical professionals.

A potential future workflow is:

```text
                 Fundus Image
                      │
                      ▼
                 AI Screening
                      │
             ┌────────┴────────┐
             │                 │
        Low-Risk Case     Referable Case
             │                 │
             ▼                 ▼
       Routine Path       Expert Review
                               │
                               ▼
                       Clinical Decision
```

The AI system would act as a screening and decision-support component.

---

# 21. Scalable Deployment Research

After appropriate validation, future research could investigate deployment across larger healthcare networks.

Potential architecture:

```text
Rural Screening Center
          │
          ▼
     Local Capture
          │
          ▼
   AI Screening Layer
          │
          ▼
   Central Review Hub
          │
          ▼
   Specialist Network
```

This would require extensive technical, clinical, privacy, security, and regulatory work.

---

# 22. Mobile / Edge Deployment

A future version could investigate deployment closer to the point of image acquisition.

Potential options could include:

* Lightweight AI models
* Edge inference
* Offline-first workflows
* Periodic synchronization
* Low-bandwidth operation

Conceptually:

```text
Fundus Camera
     │
     ▼
Edge Device
     │
     ├── Local Quality Check
     ├── Local AI Screening
     └── Store / Sync
             │
             ▼
       Remote Specialist
```

This is a future research direction and is not part of the current prototype.

---

# 23. Model Optimization

For future deployment research, models could be optimized for constrained environments.

Potential techniques include:

* Model compression
* Quantization
* Knowledge distillation
* Efficient architectures
* Reduced input resolution where appropriate

The objective would be to reduce computational requirements while maintaining acceptable validated performance.

---

# 24. Continuous Evaluation

A mature system would require continuous monitoring after deployment.

Potential monitoring areas include:

```text
Model Performance
       │
       ├── Dataset Drift
       ├── Image Quality Drift
       ├── Prediction Distribution
       ├── Calibration
       └── Error Analysis
```

Any such system would require appropriate governance and human oversight.

---

# 25. Future Roadmap

A high-level roadmap for DRISHTI is:

| Phase   | Focus                                  |
| ------- | -------------------------------------- |
| Phase 1 | Current academic prototype             |
| Phase 2 | Trained DR classification              |
| Phase 3 | Multi-dataset evaluation               |
| Phase 4 | Advanced lesion detection              |
| Phase 5 | Grad-CAM and stronger explainability   |
| Phase 6 | Expert / clinical validation           |
| Phase 7 | Robustness and system-level validation |
| Phase 8 | Deployment research                    |

The phases are indicative research stages rather than committed implementation timelines.

---

# 26. What Is Not Part of the Current Prototype

The following should not be interpreted as currently implemented:

* Clinical deployment
* Clinical validation
* Certified medical device functionality
* Grad-CAM-based trained-model explanation
* Fully automated lesion segmentation
* Multi-dataset validation
* Production telemedicine infrastructure
* Real patient deployment
* IoT integration

These belong to future research or deployment stages.

---

# 27. Long-Term Vision

The long-term research vision is to develop a system that combines:

```text
        QUALITY-AWARE SCREENING
                  +
          EXPLAINABLE AI
                  +
       HUMAN-IN-THE-LOOP REVIEW
                  +
        RURAL WORKFLOW MODEL
                  +
         MULTI-DATASET VALIDATION
```

The goal would be to create a more transparent and scalable screening-assistance workflow for settings where specialist access may be limited.

---

# 28. Final Perspective

DRISHTI currently demonstrates the feasibility of connecting:

```text
Retinal Image
     ↓
Quality Assessment
     ↓
AI-Assisted Screening
     ↓
Explainability
     ↓
Automated Reporting
     ↓
Telemedicine Capacity Modelling
```

Future work would focus on improving the underlying models, expanding datasets, strengthening explainability, validating performance with appropriate experts and datasets, and investigating scalable deployment.

Any transition toward clinical use would require substantially more evidence, validation, governance, and regulatory assessment than the current academic prototype provides.

---

## Related Documentation

* [`Project Overview`](PROJECT_OVERVIEW.md)
* [`System Architecture`](SYSTEM_ARCHITECTURE.md)
* [`Datasets`](DATASETS.md)
* [`Prototype Workflow`](PROTOTYPE_WORKFLOW.md)
* [`MATLAB & Simulink`](MATLAB_SIMULINK.md)
* [`Results`](RESULTS.md)
* [`Disclaimer`](DISCLAIMER.md)
