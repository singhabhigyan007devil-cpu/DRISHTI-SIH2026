# DRISHTI — Prototype Results

## 1. Overview

This document summarizes the outputs and observations obtained from the current DRISHTI prototype.

The current prototype demonstrates four major capabilities:

1. Fundus image quality assessment
2. Image enhancement and prototype DR screening
3. Explainability and evidence visualization
4. Rural telemedicine capacity simulation using Simulink

The results presented here are **prototype and demonstration results**. They are not clinical validation results.

---

# 2. Current Prototype Dataset

The current prototype uses a subset of the:

**APTOS 2019 dataset**

Current implementation:

| Parameter           | Current Prototype             |
| ------------------- | ----------------------------- |
| Dataset             | APTOS 2019                    |
| Number of images    | 100                           |
| Image format        | PNG                           |
| Purpose             | Development and demonstration |
| Clinical validation | Not performed                 |

The prototype has not yet been evaluated across all planned datasets.

---

# 3. Image Quality Gate Results

The quality gate evaluates whether an input fundus image is suitable for continuing through the prototype workflow.

The current quality assessment considers:

* Focus / blur
* Brightness
* Dark-region characteristics

The decision flow is:

```text
                 FUNDUS IMAGE
                      │
                      ▼
              QUALITY ANALYSIS
                      │
              ┌───────┴───────┐
              │               │
           ACCEPT           REJECT
              │               │
              ▼               ▼
        Continue          Recapture
```

---

# 4. Accepted Image Example

During prototype testing, an input image produced the following example quality values:

```text
Focus Score:    0.00018
Brightness:     0.399
Dark Ratio:     0.336

Decision: ACCEPTED
```

The image therefore continued through the remaining prototype workflow.

These numerical values are **example outputs from the prototype**, not standardized clinical image-quality thresholds.

---

# 5. Rejected Image Example

A deliberately degraded/blurred test image was also used to demonstrate the rejection path.

Example output:

```text
Focus Score:    0.00001
Dark Ratio:     0.331

Decision: REJECTED

Issue:
BLURRY IMAGE

Action:
Refocus and recapture the retinal image.
```

This demonstrates that the workflow can distinguish an intentionally degraded image from an accepted input according to the prototype's quality-gate logic.

---

# 6. Quality-Aware Screening Workflow

The demonstrated behaviour is:

```text
                 Input Image
                     │
                     ▼
               Quality Gate
                     │
          ┌──────────┴──────────┐
          │                     │
       ACCEPT                  REJECT
          │                     │
          ▼                     ▼
     Enhancement          Recapture Feedback
          │
          ▼
     DR Screening
```

The quality gate is an important part of the proposed workflow because poor-quality retinal images can reduce the usefulness of downstream screening.

---

# 7. Image Enhancement Result

Images passing the quality gate proceed to the enhancement stage.

The prototype incorporates image-processing concepts such as:

* Contrast enhancement
* CLAHE
* Illumination normalization

A generated output is:

```text
results/enhanced_fundus.png
```

The enhanced image is used for subsequent visualization and prototype processing.

---

# 8. Prototype DR Screening Result

A representative demonstration produced:

```text
DR Grade: 2
Classification: Moderate Non-Proliferative DR
Confidence: 87%
```

The ICDR-style representation used by the prototype is:

| Grade | Representation   |
| ----: | ---------------- |
|     0 | No apparent DR   |
|     1 | Mild NPDR        |
|     2 | Moderate NPDR    |
|     3 | Severe NPDR      |
|     4 | Proliferative DR |

---

# 9. Important Interpretation of the 87% Value

The displayed **87% confidence is a demonstration value** from the current prototype.

It must **not** be interpreted as:

* 87% model accuracy
* 87% sensitivity
* 87% specificity
* 87% clinical probability
* Clinically calibrated confidence
* Validated diagnostic performance

The current prototype does not claim clinical model performance.

---

# 10. Explainability Results

The prototype generates visual evidence representations alongside the screening workflow.

Current evidence representations include:

```text
Bright-region evidence
Dark-region evidence
Local-variation evidence
```

The conceptual output is:

```text
             Enhanced Fundus Image
                      │
                      ▼
               Evidence Analysis
                      │
          ┌───────────┼───────────┐
          │           │           │
          ▼           ▼           ▼
       Bright       Dark        Local
       Regions      Regions     Variation
          │           │           │
          └───────────┼───────────┘
                      │
                      ▼
               Evidence Map
```

An example output is:

```text
results/explainability_map.png
```

---

# 11. Lesion Reference Result

The prototype also supports creation of a lesion/evidence reference visualization.

Example output:

```text
results/lesion_reference.png
```

This visualization is intended to support demonstration of explainability concepts.

It should not be interpreted as clinically validated lesion segmentation.

---

# 12. Automated Report Result

The prototype can generate an automated textual report.

Example output:

```text
results/DRISHTI_Report.txt
```

The report can contain fields such as:

```text
Demo / Patient ID
Image Quality
DR Grade
Classification
Confidence
Evidence
Recommendation
Timestamp
```

This demonstrates how screening information can be consolidated into a structured output.

---

# 13. End-to-End Demonstration

The complete prototype demonstration follows:

```text
               FUNDUS IMAGE
                    │
                    ▼
              IMAGE QUALITY
                    │
          ┌─────────┴─────────┐
          │                   │
       REJECT                ACCEPT
          │                   │
          ▼                   ▼
     RECATURE             ENHANCEMENT
     FEEDBACK                  │
                               ▼
                         DR SCREENING
                               │
                               ▼
                        EXPLAINABILITY
                               │
                               ▼
                         AUTO REPORT
```

The demonstration confirms that the individual prototype modules can be connected into a single workflow.

---

# 14. Simulink Results

The rural telemedicine capacity model is implemented in:

```text
src/rural_capacity_model.slx
```

The model represents:

* Incoming screening demand
* AI screening
* Human review
* Review capacity
* Remaining work
* Backlog

Conceptually:

```text
Incoming Demand
       │
       ▼
 AI Screening
       │
       ▼
Human Review Queue
       │
       ▼
Review Capacity
       │
       ▼
Remaining Work
       │
       ▼
Backlog
```

---

# 15. Capacity Simulation Observations

During prototype development, the model was used to observe values such as:

```text
Peak Incoming Demand
Peak Review Capacity
Remaining Review
AI Backlog
```

The simulation demonstrates the relationship between incoming workload and available review capacity.

When workload exceeds available review capacity, remaining work can accumulate as backlog.

---

# 16. Non-Negative Backlog

The Simulink model includes logic to prevent the simulated backlog from becoming negative.

Conceptually:

```text
Calculated Remaining Work
            │
            ▼
       Max(Value, 0)
            │
            ▼
     Non-Negative Backlog
```

This ensures that the simulated workload remains meaningful.

---

# 17. MATLAB + Simulink Combined Result

The current prototype demonstrates two complementary layers:

```text
┌──────────────────────────────────┐
│             MATLAB               │
│                                  │
│ Fundus Image                     │
│      ↓                           │
│ Quality Gate                     │
│      ↓                           │
│ Enhancement                      │
│      ↓                           │
│ DR Screening                     │
│      ↓                           │
│ Explainability                   │
│      ↓                           │
│ Report                           │
└────────────────┬─────────────────┘
                 │
                 ▼
┌──────────────────────────────────┐
│            SIMULINK              │
│                                  │
│ Incoming Demand                  │
│      ↓                           │
│ AI Screening                     │
│      ↓                           │
│ Human Review                     │
│      ↓                           │
│ Capacity                         │
│      ↓                           │
│ Remaining Work / Backlog         │
└──────────────────────────────────┘
```

This demonstrates how the image-level screening concept can be connected to a broader healthcare workflow model.

---

# 18. Prototype Output Files

The current repository can contain demonstration outputs such as:

```text
results/
├── enhanced_fundus.png
├── explainability_map.png
├── lesion_reference.png
└── DRISHTI_Report.txt
```

These outputs provide visual and textual evidence of the prototype workflow.

---

# 19. Results Summary

| Component               | Demonstrated Result   |
| ----------------------- | --------------------- |
| Fundus image input      | Working               |
| Image quality gate      | Demonstrated          |
| Blur rejection          | Demonstrated          |
| Recapture feedback      | Demonstrated          |
| Image enhancement       | Demonstrated          |
| ICDR-style screening    | Demonstrated          |
| Evidence visualization  | Demonstrated          |
| Automated report        | Demonstrated          |
| MATLAB application      | Prototype implemented |
| Simulink capacity model | Demonstrated          |
| Clinical validation     | Not performed         |

---

# 20. What These Results Demonstrate

The current results demonstrate the **technical workflow concept**, rather than validated medical performance.

The prototype shows how:

```text
Poor-quality image
        ↓
Can be rejected before screening

Acceptable image
        ↓
Can continue through processing

Screening output
        ↓
Can be accompanied by visual evidence

Screening information
        ↓
Can be converted into a structured report

Multiple screening cases
        ↓
Can be represented in a capacity simulation
```

---

# 21. Current Limitations

The current results have important limitations.

### Dataset Size

Only 100 APTOS images are currently included.

### Dataset Diversity

The current implementation has not yet been evaluated across all selected datasets.

### Model Validation

The prototype does not provide clinical validation.

### Confidence

The displayed confidence value is demonstration-level and is not clinically calibrated.

### Explainability

Current evidence maps are prototype visualizations rather than validated lesion-level explanations.

### Simulation

The Simulink model is a simplified capacity representation rather than a validated model of a specific healthcare network.

---

# 22. Planned Evaluation

Future development will expand evaluation using the selected/planned datasets:

```text
APTOS 2019
     │
     ├── Current: 100-image prototype subset
     │
     ▼
Future Evaluation
     │
     ├── DRIVE
     ├── IDRiD
     └── MESSIDOR-2
```

The purpose of future evaluation would be to assess robustness across different retinal-image datasets.

No results from these planned datasets are claimed in the current prototype.

---

# 23. Future Performance Evaluation

A future trained model could be evaluated using appropriate metrics such as:

* Accuracy
* Precision
* Recall
* Sensitivity
* Specificity
* F1-score
* AUROC
* Confusion matrix
* Calibration measures

These metrics are listed as **future evaluation requirements**, not current prototype results.

---

# 24. Future Explainability Evaluation

Future explainability development could evaluate:

* Localization quality
* Lesion-level detection
* Grad-CAM consistency
* Agreement with expert annotations
* Explanation faithfulness

Grad-CAM and advanced lesion-level explainability are future development directions.

---

# 25. Responsible Interpretation

The results in this document should be viewed as evidence that the proposed prototype workflow has been implemented at an academic demonstration level.

They should not be used to make medical decisions.

A clinically deployable system would require significantly broader validation, clinical testing, appropriate governance, privacy protection, security, regulatory review, and medical oversight.

---

# 26. Conclusion

The current DRISHTI prototype demonstrates:

```text
Quality-Aware Fundus Screening
             +
Explainability
             +
Automated Reporting
             +
Rural Capacity Simulation
```

The MATLAB component demonstrates the image-level workflow, while the Simulink component demonstrates the system-level capacity workflow.

The current results establish a functional prototype foundation for further development and validation.

---

## Related Documentation

* [`Project Overview`](PROJECT_OVERVIEW.md)
* [`System Architecture`](SYSTEM_ARCHITECTURE.md)
* [`Datasets`](DATASETS.md)
* [`Prototype Workflow`](PROTOTYPE_WORKFLOW.md)
* [`MATLAB & Simulink`](MATLAB_SIMULINK.md)
* [`Future Scope`](FUTURE_SCOPE.md)
* [`Disclaimer`](DISCLAIMER.md)
