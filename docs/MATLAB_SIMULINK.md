# DRISHTI — MATLAB & Simulink Implementation

## 1. Overview

DRISHTI uses **MATLAB and Simulink** to demonstrate an explainable diabetic retinopathy screening workflow and a rural telemedicine capacity model.

The implementation is divided into two complementary parts:

```text
┌─────────────────────────────┐
│           MATLAB            │
│                             │
│ Fundus Image Processing     │
│ Quality Assessment          │
│ Enhancement                 │
│ DR Screening                │
│ Explainability              │
│ Report Generation           │
│ App Designer Interface      │
└──────────────┬──────────────┘
               │
               │ Screening Workflow
               ▼
┌─────────────────────────────┐
│          SIMULINK           │
│                             │
│ Incoming Demand             │
│ AI Screening                │
│ Human Review Capacity       │
│ Remaining Review            │
│ Backlog Analysis            │
└─────────────────────────────┘
```

---

# 2. Why MATLAB?

MATLAB provides a convenient environment for developing the image-processing and AI-oriented components of the DRISHTI prototype.

The current implementation uses MATLAB for:

* Fundus image loading
* Image-quality analysis
* Image enhancement
* Prototype DR screening
* Evidence visualization
* Automated reporting
* Graphical application development

The implementation is organized into modular `.m` files so that individual stages can be tested independently.

---

# 3. Why Simulink?

Simulink is used to represent the **system-level healthcare workflow** rather than individual retinal pixels.

The Simulink model demonstrates how an AI-assisted screening system could interact with:

* Incoming screening demand
* Automated AI screening
* Human review
* Review capacity
* Remaining workload
* Backlog

This provides a system-level view of the rural telemedicine concept.

---

# 4. MATLAB Project Structure

The MATLAB source files are organized as follows:

```text
src/
│
├── DRISHTI_App.mlapp
├── main.m
├── run_demo.m
├── quality_gate.m
├── dr_classifier.m
├── explainability.m
├── generate_report.m
├── create_lesion_reference.m
├── create_blurry_test.m
└── rural_capacity_model.slx
```

---

# 5. `DRISHTI_App.mlapp`

The file:

```text
DRISHTI_App.mlapp
```

contains the MATLAB App Designer interface.

The application provides the user-facing workflow for the prototype.

The intended interaction is:

```text
Select Fundus Image
        │
        ▼
Run DRISHTI Screening
        │
        ▼
Quality Assessment
        │
        ▼
Screening Result
        │
        ▼
Explainability Evidence
        │
        ▼
Recommendation / Report
```

The application is intended to make the prototype easier to demonstrate during presentations and evaluation.

---

# 6. `main.m`

The file:

```text
main.m
```

serves as the main execution entry point for the MATLAB workflow.

Its purpose is to connect the individual processing modules into a sequential workflow.

Conceptually:

```text
main.m
  │
  ├── Load image
  │
  ├── Quality gate
  │
  ├── Enhancement
  │
  ├── DR screening
  │
  ├── Explainability
  │
  └── Report
```

---

# 7. `run_demo.m`

The file:

```text
run_demo.m
```

is used for demonstrating the end-to-end prototype workflow.

It allows the complete pipeline to be executed as a demonstration without requiring the user to manually run each module separately.

Conceptual execution:

```text
run_demo
   │
   ▼
Input Fundus Image
   │
   ▼
Quality Gate
   │
   ▼
Enhancement
   │
   ▼
Screening
   │
   ▼
Explainability
   │
   ▼
Report
```

---

# 8. `quality_gate.m`

The file:

```text
quality_gate.m
```

implements the prototype image-quality assessment stage.

The current quality gate considers:

* Focus / blur
* Brightness
* Dark-region characteristics

The purpose is to prevent obviously unsuitable images from proceeding through the rest of the workflow.

Conceptually:

```text
             Fundus Image
                  │
                  ▼
           Quality Analysis
                  │
        ┌─────────┴─────────┐
        │                   │
      PASS                 FAIL
        │                   │
        ▼                   ▼
   Continue             Recapture
```

A failed quality check can provide feedback such as:

```text
BLURRY IMAGE
Refocus and recapture.
```

---

# 9. Image Enhancement

The accepted image proceeds to enhancement.

The prototype incorporates image-processing concepts including:

* Contrast enhancement
* CLAHE
* Illumination normalization

The objective is to make retinal structures and visual evidence easier to inspect.

```text
Original Fundus Image
        │
        ▼
Quality Gate
        │
        ▼
Enhancement
        │
        ▼
Enhanced Fundus Image
```

Example output:

```text
results/enhanced_fundus.png
```

---

# 10. `dr_classifier.m`

The file:

```text
dr_classifier.m
```

represents the DR screening component.

The prototype uses an ICDR-style severity representation:

```text
Grade 0 → No apparent DR
Grade 1 → Mild NPDR
Grade 2 → Moderate NPDR
Grade 3 → Severe NPDR
Grade 4 → Proliferative DR
```

The current implementation is a prototype/demo-level classification workflow.

It is not a clinically validated diagnostic model.

---

# 11. Demonstration Classification

One prototype demonstration produced:

```text
DR Grade: 2
Classification: Moderate Non-Proliferative DR
Confidence: 87%
```

These values are demonstration outputs.

They must not be interpreted as measured clinical model performance.

In particular, the 87% value is not claimed to represent:

* Accuracy
* Sensitivity
* Specificity
* Clinical probability
* Validated model confidence

---

# 12. `explainability.m`

The file:

```text
explainability.m
```

generates visual evidence representations.

The current prototype includes evidence based on image characteristics such as:

* Bright regions
* Dark regions
* Local intensity variation

The purpose is to provide an interpretable visual layer around the screening output.

---

# 13. Evidence Visualization

The current concept is:

```text
Enhanced Fundus Image
         │
         ▼
   Evidence Analysis
         │
   ┌─────┼─────┐
   │     │     │
   ▼     ▼     ▼
Bright  Dark  Local
Regions Regions Variation
   │     │     │
   └─────┼─────┘
         │
         ▼
   Evidence Map
```

The output can be saved as:

```text
results/explainability_map.png
```

---

# 14. `create_lesion_reference.m`

The file:

```text
create_lesion_reference.m
```

supports generation of a lesion/evidence reference visualization.

Example output:

```text
results/lesion_reference.png
```

This visualization is intended for demonstration.

It does not represent clinically validated lesion segmentation.

---

# 15. `create_blurry_test.m`

The file:

```text
create_blurry_test.m
```

supports testing of the image-quality gate using a deliberately blurred image.

The purpose is to demonstrate the rejection path:

```text
Good Image
    │
    ▼
Create Blurry Test Image
    │
    ▼
Quality Gate
    │
    ▼
Rejected
    │
    ▼
Recapture Feedback
```

This demonstrates the quality-aware design of the workflow.

---

# 16. `generate_report.m`

The file:

```text
generate_report.m
```

generates a textual screening report from the workflow outputs.

The report can include:

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

Example output:

```text
results/DRISHTI_Report.txt
```

---

# 17. MATLAB End-to-End Pipeline

The complete MATLAB pipeline can be represented as:

```text
                 START
                   │
                   ▼
          Select / Load Image
                   │
                   ▼
             Quality Gate
                   │
          ┌────────┴────────┐
          │                 │
       REJECT             ACCEPT
          │                 │
          ▼                 ▼
     Recapture         Enhancement
                            │
                            ▼
                       DR Screening
                            │
                            ▼
                      Explainability
                            │
                            ▼
                     Report Generation
                            │
                            ▼
                           END
```

---

# 18. MATLAB Outputs

The workflow can produce several demonstration outputs:

```text
results/
│
├── enhanced_fundus.png
├── explainability_map.png
├── lesion_reference.png
└── DRISHTI_Report.txt
```

These outputs allow the processing stages to be visually and textually inspected.

---

# 19. Simulink Model

The Simulink model is stored as:

```text
rural_capacity_model.slx
```

Its purpose is to model the rural telemedicine screening workload.

The model is not intended to simulate every real-world healthcare process.

Instead, it demonstrates the relationship between:

```text
Incoming Demand
      ↓
AI Screening
      ↓
Human Review
      ↓
Review Capacity
      ↓
Remaining Work
      ↓
Backlog
```

---

# 20. Simulink Workflow

The conceptual Simulink workflow is:

```text
┌─────────────────────┐
│ Incoming Demand     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ AI Screening        │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Human Review Queue  │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Review Capacity     │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Remaining Work      │
└──────────┬──────────┘
           │
           ▼
┌─────────────────────┐
│ Backlog              │
└─────────────────────┘
```

---

# 21. Simulink Parameters

The prototype model uses configurable signal and capacity parameters.

Examples used during prototype development include:

```text
Amplitude
Bias
Frequency
AI screening capacity
Review capacity
Incoming demand
Backlog
```

The exact values are demonstration parameters rather than measurements of a specific real-world rural healthcare network.

---

# 22. Non-Negative Backlog

The simulation includes logic to prevent the backlog from becoming negative.

Conceptually:

```text
Raw Remaining Work
        │
        ▼
Maximum with Zero
        │
        ▼
Non-Negative Backlog
```

This ensures that the simulated backlog remains physically meaningful.

---

# 23. Peak Demand and Review Capacity

The simulation can be used to visualize differences between incoming workload and available human-review capacity.

Conceptually:

```text
Incoming Demand
       │
       │       /\        /\
       │      /  \      /  \
       │_____/____\____/____\____
       │
       └──────────────────────────► Time


Review Capacity
       │
       │──────────────────────────
       │
       └──────────────────────────► Time
```

When incoming workload exceeds available review capacity, remaining work can accumulate.

---

# 24. Relationship Between MATLAB and Simulink

The two components represent different layers of the DRISHTI system.

| MATLAB             | Simulink           |
| ------------------ | ------------------ |
| Image processing   | System modelling   |
| Quality assessment | Incoming workload  |
| Enhancement        | AI screening flow  |
| DR screening       | Human review       |
| Explainability     | Review capacity    |
| Report generation  | Remaining workload |
| User interface     | Backlog analysis   |

The two components are therefore complementary rather than duplicate implementations.

---

# 25. MATLAB App + Simulink Concept

The intended high-level system is:

```text
                 RETINAL IMAGE
                      │
                      ▼
              MATLAB / DRISHTI
                      │
        ┌─────────────┼─────────────┐
        │             │             │
        ▼             ▼             ▼
     Quality      Screening    Explainability
        │             │             │
        └─────────────┼─────────────┘
                      │
                      ▼
                   Report
                      │
                      ▼
              AI Screening Flow
                      │
                      ▼
                 SIMULINK
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
     Demand        Review        Backlog
                    Capacity
```

This demonstrates how an image-level AI screening workflow could fit into a larger rural telemedicine workflow.

---

# 26. Current Dataset Used by MATLAB

The current prototype uses:

```text
Dataset: APTOS 2019
Images: 100
Format: PNG
Purpose: Prototype / development / demonstration
```

The current implementation does not claim to have evaluated the prototype across all selected datasets.

---

# 27. Planned Dataset Expansion

The following datasets are selected/planned for future evaluation:

```text
DRIVE
IDRiD
MESSIDOR-2
```

Potential future roles include:

| Dataset    | Potential Future Role                  |
| ---------- | -------------------------------------- |
| DRIVE      | Retinal vessel / structural evaluation |
| IDRiD      | DR and lesion-related evaluation       |
| MESSIDOR-2 | Broader cross-dataset DR evaluation    |

These datasets are not claimed as part of the current 100-image implementation.

---

# 28. Future MATLAB Development

Future versions may include:

* Trained deep-learning DR classifier
* More robust image-quality model
* Automated optic-disc localization
* Automated fovea localization
* Lesion detection
* Lesion segmentation
* Grad-CAM
* Calibrated model confidence
* Larger multi-dataset evaluation
* External validation

These are future development directions rather than claims about the current implementation.

---

# 29. Future Simulink Development

The Simulink model could later be expanded to represent:

* Variable rural patient arrival rates
* Multiple screening centers
* Different AI processing rates
* Different specialist capacities
* Network delays
* Queueing effects
* Referral thresholds
* Resource constraints
* Sensitivity analysis
* Scenario comparison

Such extensions would allow more detailed system-level experimentation.

---

# 30. MATLAB and Simulink Role in the SIH Prototype

The combination of MATLAB and Simulink supports the two major technical layers of DRISHTI:

```text
                 DRISHTI
                    │
       ┌────────────┴────────────┐
       │                         │
       ▼                         ▼
     MATLAB                  SIMULINK
       │                         │
       ▼                         ▼
 Image-Level AI             System-Level
 Workflow                   Workflow
       │                         │
       ▼                         ▼
 Screening                  Capacity
 Explainability             Workload
 Reporting                  Backlog
```

This separation keeps the prototype modular and makes the architecture easier to demonstrate.

---

# 31. Current Implementation Status

| Component                         | Status        |
| --------------------------------- | ------------- |
| MATLAB image input                | Implemented   |
| Image quality gate                | Implemented   |
| Focus / blur analysis             | Implemented   |
| Brightness analysis               | Implemented   |
| Dark-region analysis              | Implemented   |
| Image enhancement                 | Implemented   |
| Prototype DR classification       | Implemented   |
| Evidence visualization            | Implemented   |
| Automated report                  | Implemented   |
| MATLAB App Designer interface     | Implemented   |
| Simulink rural capacity model     | Implemented   |
| Grad-CAM                          | Future        |
| Trained clinical-grade classifier | Future        |
| Multi-dataset validation          | Future        |
| Clinical validation               | Not performed |
| IoT integration                   | Not included  |

---

# 32. Important Technical Disclaimer

The MATLAB and Simulink implementation is an **academic prototype** created for the Smart India Hackathon 2026 problem statement.

The current implementation should not be considered:

* A medical diagnostic device
* A clinically validated AI system
* A substitute for an ophthalmologist
* A certified healthcare product
* Evidence of clinical model performance

The demonstrated screening outputs are intended to show the proposed workflow and technical concept.

---

# 33. Summary

The DRISHTI MATLAB implementation demonstrates the image-level screening workflow:

```text
Fundus Image
     ↓
Quality Gate
     ↓
Enhancement
     ↓
DR Screening
     ↓
Explainability
     ↓
Automated Report
```

The Simulink implementation demonstrates the system-level workflow:

```text
Incoming Demand
     ↓
AI Screening
     ↓
Human Review
     ↓
Capacity
     ↓
Remaining Work
     ↓
Backlog
```

Together, they form the current DRISHTI prototype architecture for **explainable diabetic retinopathy screening and rural telemedicine workflow modelling**.
