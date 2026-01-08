# Phytoecological Classification & Indicator Species Analysis : Biosphere Reserve of Mono, South-West Benin

## 📌 Context

This project is based on phytosociological surveys conducted in the community-based conservation areas (ACCB) of **Naglanou** and **Adjamé**, located within the **Mono Biosphere Reserve (South-West Benin)**.
The objective is to **characterize vegetation assemblages** and relate them to environmental gradients and anthropogenic pressures using **multivariate ecological methods**.

## 📊 Data

* **Phytosociological relevés** (species abundance–dominance and presence–absence)
* **Secondary environmental matrix**, including:

  * Soil type
  * Woody layer cover
  * Herbaceous layer cover
  * Anthropogenic disturbance
  * Moisture regime
* Slope was excluded due to low discriminative power

## 🔬 Methodology

1. Construction of:

   * Species × relevés matrices (abundance–dominance and presence–absence)
   * Environmental matrix of relevés
2. **Hierarchical Clustering Analysis (HCA)** to identify vegetation groups
3. **Ordination (DCA)** to explore compositional gradients
4. **Diversity analysis**:

   * Species richness
   * Shannon diversity index
   * Pielou’s evenness
5. **Multilevel Pattern Analysis (IndVal.g)** to identify indicator species associated with each vegetation group

## 🌿 Identified Vegetation Groups

Four major vegetation groups were discriminated:

### Group 1 – Anthropized humid fallows and palm groves

**Indicator species:** *Elaeis guineensis*, *Chromolaena odorata*, *Azadirachta indica*

* Strong anthropogenic influence
* Temporarily to permanently humid soils
* Low evenness, dominance of disturbance-tolerant species

### Group 2 – Hygrophilous riparian formations

**Indicator species:** *Pterocarpus santalinoides*, *Warneekea memecycloides*

* Clayey to hydromorphic soils
* Quasi-permanent moisture
* Structurally stable woody vegetation

### Group 3 – Permanent marshy grasslands

**Indicator species:** *Leersia hexandra*, *Ludwigia octovalvis*

* Permanently flooded conditions
* Herbaceous dominance
* High ecological specialization

### Group 4 – Savanna formations

**Indicator species:** *Andropogon gayanus*, *Antidesma venosum*

* Temporarily humid to dry environments
* Fire- and grazing-tolerant vegetation
* Moderate anthropogenic pressure

**Transitional species** (*Mitragyna inermis*, *Paullinia pinnata*) highlight ecotonal zones between forested and savanna formations.

## 📈 Diversity Patterns

Vegetation groups differ markedly in:

* Species richness
* Shannon diversity
* Evenness

Highly anthropized or environmentally constrained habitats show **lower evenness**, while structurally complex formations exhibit **higher diversity but moderate dominance effects**.

## 🔍 Key Insights

* Multivariate classification reveals **clear ecological gradients** driven mainly by moisture regime and anthropogenic pressure
* Indicator species analysis is essential to move from **statistical clusters** to **ecologically interpretable vegetation units**
* The approach highlights the role of **hydrology and land use** in structuring vegetation in coastal West African ecosystems

## 🛠 Tools

* R (`vegan`, `indicspecies`, `dplyr`)
* Multivariate ecological analysis
