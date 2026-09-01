# 🗺️ Feuille de Route Clinique Interactive & Matrice d'Exploitation du Corpus (Dr. CAT)

> **Répertoire Clinique Exhaustif & Matrice RAG générée le 30 août 2026**.
> Mappe l'ensemble des pathologies, ordonnances et protocoles thérapeutiques extraits des 77 manuels médicaux offline.

---

## 📊 1. Synthèse Globale du Corpus Médical Offline

| Indicateur | Valeur |
| :--- | :---: |  | **Ouvrages & Référentiels Médicaux Indexés** | **77 manuels** |  | **Pages Scannées & Mémorisées en RAM** | **2,700 pages** |  | **Pathologies & Fiches Candidates Mappées** | **155 fiches cliniques** |
| 🟢 **Grade A (Gold Standard - Score ≥ 85/100)** | **42 fiches** (27%) |
| 🟡 **Grade B (Prêt pour découpage & enrichissement - Score 60-84)** | **47 fiches** (30%) |
| 🔴 **Grade C (Nécessite consensus dédié - Score < 60)** | **66 fiches** (43%) |

---

## 📋 2. Guide d'Exécution pour le Médecin (Phase 4 & Phase 5)

1. **Consulter la spécialité cible** dans la matrice ci-dessous.
2. **Ouvrir le PDF Lab** sur votre tablette (`http://localhost:3000` ➔ *PDF Ingestion & Visual Curation Lab*).
3. **Repérer le manuel cité** en *Source Principale* et découper les pages indiquées avec le Visual Slicer ➔ **"✂️ Découper & Sauvegarder en Staging"** *(0 tokens brûlés)*.
4. **Lancer la Génération RAG** dans le Generator Lab pour compiler la fiche définitive avec le validateur médical.

---

## 🩺 3. Matrice Clinique par Spécialité (17 spécialités)

### 🩺 Gastro-entérologie (19 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Intoxication alimentaire & Toxi-infection (TIAC)** | **100/100** | 🟢 **A** | 📄 **Entretiens_.pdf**<br>(P.5, P.30, P.33, P.35, P.41, P.43, P.64, P.89, P.108-109, P.112-115, P.119, P.131, P.152, P.154, P.167, P.173) | • Gastrologie_.pdf (P.3, P.9, P.13, P.20, P.33, P.40-41, P.48, P.51, P.58, P.62, P.64-66, P.68, P.75-77, P.87, P.90)<br>• CAT Gynécologie_(3).pdf (P.1, P.32, P.50, P.53, P.62, P.69-70, P.72-74, P.86, P.97, P.103) |
|  | **Diarrhée chronique de l'adulte** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.1, P.33, P.39, P.44-45, P.47, P.49, P.51, P.55, P.67, P.70, P.74-76, P.81, P.86, P.92, P.94) | • Entretiens_.pdf (P.7, P.39, P.47, P.56, P.60, P.64, P.72, P.79, P.97, P.109, P.139, P.157, P.162, P.173)<br>• Urologie_.pdf (P.2, P.8-9, P.19-22, P.25, P.37, P.39, P.41, P.43, P.47-48) |
|  | **Diarrhée aiguë de l'adulte** | **95/100** | 🟢 **A** | 📄 **Entretiens_.pdf**<br>(P.12, P.36, P.44, P.46, P.54, P.74-76, P.108, P.116-117) | • Gastrologie_.pdf (P.7, P.33-34, P.36-37, P.39, P.48, P.58-59, P.76, P.88)<br>• 150 Ordonnances types.pdf (P.4, P.26, P.50-52, P.80, P.94, P.133) |
|  | **Occlusion intestinale aiguë** | **95/100** | 🟢 **A** | 📄 **ECG.pdf**<br>(P.4, P.18, P.20, P.22, P.28-29, P.33, P.44, P.46, P.50, P.89, P.95, P.99, P.103, P.107, P.112, P.115, P.120-121, P.127, P.132) | • Gastrologie_.pdf (P.3, P.20, P.42, P.47, P.58-59, P.61, P.63, P.68, P.77, P.85, P.87)<br>• 150 Ordonnances types.pdf (P.11, P.34, P.46-47, P.113, P.125, P.136) |
|  | **Constipation aiguë & chronique de l'adulte** | **86/100** | 🟢 **A** | 📄 **Gastrologie_.pdf**<br>(P.2, P.16-24, P.26, P.29-30, P.39, P.45, P.66, P.83) | • Médicaments en Gastrologie.pdf (P.1-2, P.5, P.7, P.9, P.11-13, P.16-17)<br>• 2Médicaments.pdf (P.52-57) |
|  | **Reflux Gastro-Œsophagien (RGO) & Pyrosis** | **84/100** | 🟡 **B** | 📄 **Gastrologie_.pdf**<br>(P.3, P.26, P.44, P.47, P.51, P.56, P.79-81, P.84-85) | • 150 Ordonnances types.pdf (P.4, P.6, P.57, P.73, P.85, P.104, P.132-133, P.150)<br>• CAT Gynécologie_(3).pdf (P.4, P.9, P.38-39, P.60, P.68-69, P.76, P.90) |
|  | **Colique hépatique & Lithiase biliaire** | **82/100** | 🟡 **B** | 📄 **Gastrologie_.pdf**<br>(P.2, P.6-7, P.11-16, P.18, P.22, P.25, P.42, P.48, P.59-60, P.64-65, P.69, P.76) | • CAT Gynécologie_(3).pdf (P.4-5, P.9, P.11-12, P.19-21, P.23, P.28, P.34, P.48, P.92)<br>• Entretiens_.pdf (P.4, P.66-67, P.69-70, P.72, P.108, P.110-111, P.115, P.117, P.160) |
|  | **Gastrite aiguë & Ulcère gastro-duodénal (UGD)** | **78/100** | 🟡 **B** | 📄 **Gastrologie_.pdf**<br>(P.2, P.26, P.47-48, P.51, P.80, P.84-86) | • 150 Ordonnances types.pdf (P.4, P.6, P.57, P.73, P.132, P.149-150)<br>• Médicaments1 .pdf (P.26-27, P.29-31) |
|  | **Hépatites virales aiguës et chroniques (B et C)** | **77/100** | 🟡 **B** | 📄 **Entretiens_.pdf**<br>(P.5, P.67, P.106-107, P.110, P.128, P.153, P.156, P.173) | • Gastrologie_.pdf (P.6, P.14, P.51, P.54-55, P.75)<br>• Pédiatrie_.pdf (P.2, P.8, P.35, P.37, P.56) |
|  | **Cholécystite aiguë lithiasique** | **76/100** | 🟡 **B** | 📄 **Gastrologie_.pdf**<br>(P.2, P.6, P.8, P.14-15, P.41) | • 3Médicaments .pdf (P.4-8)<br>• Entretiens_.pdf (P.5, P.67, P.110-111) |
|  | **Syndrome de l'intestin irritable (Colopathie fonctionnelle)** | **75/100** | 🟡 **B** | 📄 **2Médicaments.pdf**<br>(P.45-51, P.55) | • Gastrologie_.pdf (P.18, P.20, P.44, P.60, P.66, P.68-69)<br>• CAT Gynécologie_(3).pdf (P.11, P.28, P.34, P.48, P.92) |
|  | **Fissure anale & Anite** | **64/100** | 🟡 **B** | 📄 **150 Ordonnances types.pdf**<br>(P.3, P.13, P.18) | • Gastrologie_.pdf (P.2, P.45)<br>• Pédiatrie_.pdf (P.2, P.11) |
|  | **Appendicite aiguë** | **61/100** | 🟡 **B** | 📄 **CAT Pédiatrie_.pdf**<br>(P.1, P.3, P.5-6) | • Gastrologie_.pdf (P.2, P.9-10, P.40)<br>• 150 Ordonnances types.pdf (P.3, P.15) |
|  | **Pancréatite aiguë** | **60/100** | 🟡 **B** | 📄 **Gastrologie_.pdf**<br>(P.3, P.13, P.23, P.40-42, P.56, P.71, P.75, P.84) | • Gynécologie_1.pdf (P.18, P.20-21, P.23, P.68)<br>• Dermatologie_.pdf (P.7, P.58, P.108) |
|  | **Cirrhose hépatique & Décompensation œdémato-ascitique** | **55/100** | 🔴 **C** | 📄 **Antibiotiques .pdf**<br>(P.11, P.18) | • CAT Urgences(1).pdf (P.4, P.21)<br>• 2Médicaments.pdf (P.52) |
|  | **Abcès péri-anal & Fistule anale** | **47/100** | 🔴 **C** | 📄 **150 Ordonnances types.pdf**<br>(P.3, P.7-8) | • Gastrologie_.pdf (P.5, P.62)<br>• CAT Dr_Kacem.pdf (P.10) |
|  | **Hémorragie digestive haute (Hématémèse & Méléna)** | **43/100** | 🔴 **C** | 📄 **Hématologie.pdf**<br>(P.2, P.26-27) | • Gastrologie_.pdf (P.79, P.82)<br>• Médicaments des Urgences_1.pdf (P.35, P.45) |
|  | **Éradication d'Helicobacter pylori** | **41/100** | 🔴 **C** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.38-39, P.76) | • Antibiotiques .pdf (P.15)<br>• Médicaments et le jeune.pdf (P.4) |
|  | **Pathologie hémorroïdaire (Crise & Thrombose)** | **37/100** | 🔴 **C** | 📄 **150 Ordonnances types.pdf**<br>(P.3-4, P.45, P.75-77) | • Gastrologie_.pdf (P.2, P.25-27, P.29)<br>• CAT Gynécologie_(3).pdf (P.26, P.45-47) |

### 🩺 Pneumologie (10 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Asthme aigu & Crise d'asthme chez l'adulte** | **100/100** | 🟢 **A** | 📄 **Entretiens_.pdf**<br>(P.2, P.8-11, P.13, P.18, P.31, P.60, P.120-121, P.127, P.133, P.140) | • Médicaments des Urgences_1.pdf (P.2-4, P.6, P.11, P.14, P.25, P.32, P.41-42, P.44, P.49-50, P.54)<br>• CAT Gynécologie_(3).pdf (P.12, P.18, P.22-23, P.28-29, P.31, P.64, P.88-89) |
|  | **Bronchite aiguë de l'adulte sain** | **100/100** | 🟢 **A** | 📄 **150 Ordonnances types.pdf**<br>(P.3, P.11-12, P.23, P.25, P.50, P.73, P.78, P.104, P.113, P.116, P.126, P.131) | • Médicaments1 .pdf (P.8-9, P.11-13, P.27-29)<br>• Entretiens_.pdf (P.12-13, P.16, P.31, P.78, P.96, P.122) |
|  | **Exacerbation de BPCO & Décompensation respiratoire** | **95/100** | 🟢 **A** | 📄 **Entretiens_.pdf**<br>(P.2, P.8, P.11, P.13, P.15-16, P.18, P.31, P.33, P.42-43, P.84, P.104, P.119-121, P.133) | • Pneumologie_.pdf (P.2-3, P.9, P.13, P.18, P.20, P.23, P.27)<br>• CAT Dr_Boughoufala.pdf (P.1, P.6, P.8, P.11-12, P.18, P.25) |
|  | **Asthme aigu grave (AAG / Urgence)** | **91/100** | 🟢 **A** | 📄 **Entretiens_.pdf**<br>(P.9, P.11-13, P.19, P.84, P.119, P.121) | • CAT Dr_Boughoufala.pdf (P.23-26, P.28)<br>• Pédiatrie_.pdf (P.12, P.14-15, P.24, P.43) |
|  | **Pneumonie aiguë communautaire (PAC)** | **86/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.4, P.7, P.9-11, P.18-19, P.23, P.29, P.36-39, P.61) | • ORL.pdf (P.4, P.7-8, P.11, P.29, P.48, P.51-53)<br>• Entretiens_.pdf (P.8, P.13, P.16, P.23, P.64, P.78, P.85) |
|  | **Embolie pulmonaire aiguë** | **75/100** | 🟡 **B** | 📄 **Cardiologie_1.pdf**<br>(P.2, P.6, P.16-17, P.24, P.26, P.53) | • CAT Dr_Boughoufala.pdf (P.1-3, P.17, P.25)<br>• Entretiens_.pdf (P.2, P.14, P.28) |
|  | **Hémoptysie (Évaluation de gravité & Conduite)** | **72/100** | 🟡 **B** | 📄 **CAT Dr_Boughoufala.pdf**<br>(P.1, P.18, P.21, P.25) | • Pneumologie_.pdf (P.2, P.21-22)<br>• Hématologie.pdf (P.29) |
|  | **Pleurésie & Épanchement pleural liquide** | **67/100** | 🟡 **B** | 📄 **CAT Dr_Boughoufala.pdf**<br>(P.1, P.11) | • Cardiologie_1.pdf (P.13, P.18)<br>• CAT Gynécologie_(3).pdf (P.49) |
|  | **Pneumothorax spontané** | **28/100** | 🔴 **C** | 📄 **CAT Dr_Kacem.pdf**<br>(P.7, P.10) | • Gastrologie_.pdf (P.68, P.77)<br>• Pneumologie_.pdf (P.2, P.27) |
|  | **Toux chronique de l'adulte (Orientation diagnostique)** | **6/100** | 🔴 **C** | 📄 **Infectieux_.pdf**<br>(P.47) | - |

### 🩺 Cardiologie (10 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Hypertension Artérielle (HTA) de l'adulte** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.3, P.7-8, P.13, P.17, P.23-25, P.31-32, P.34, P.38, P.42, P.52-53, P.67, P.69, P.90) | • ECG.pdf (P.26, P.38, P.50, P.65, P.70-71, P.88, P.91, P.94, P.96, P.109, P.117, P.127)<br>• Entretiens_.pdf (P.3, P.15, P.38-39, P.42, P.56, P.63, P.88-89, P.125, P.139, P.152, P.166) |
|  | **Fibrillation Atriale (FA) & Flutter auriculaire** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.1, P.3-4, P.8, P.10, P.13-16, P.18, P.20, P.22, P.25-26, P.31-32, P.34-38, P.40-44, P.46-53, P.55-72, P.75-76, P.78-79, P.81-87, P.89-91, P.93-94, P.97-99, P.102-104) | • Entretiens_.pdf (P.3, P.9-10, P.13, P.20, P.22, P.27, P.37, P.39, P.43-44, P.48-51, P.53-54, P.59, P.62-63, P.65-67, P.69-70, P.72, P.76-77, P.79, P.81-83, P.85-87, P.89, P.93-94, P.96, P.98, P.100, P.105, P.108-109, P.118, P.120, P.122, P.124-125, P.127, P.134, P.137, P.143-144, P.146, P.149, P.152, P.155-157, P.161-162, P.164, P.166, P.168)<br>• ECG.pdf (P.3, P.9, P.15-16, P.24, P.26, P.29, P.35, P.40, P.46-47, P.51-52, P.54, P.58-59, P.62-64, P.67-68, P.70-71, P.73-74, P.76, P.79, P.83-84, P.86-87, P.91-92, P.96, P.100, P.103, P.107, P.110, P.112-114, P.117, P.121, P.123-124, P.129-130) |
|  | **Insuffisance cardiaque chronique & Suivi** | **95/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.31-32, P.64, P.66, P.71-72, P.97) | • CAT Dr_Boughoufala.pdf (P.1, P.11-12, P.18, P.26)<br>• CAT Urgences(1).pdf (P.16, P.22, P.24) |
|  | **Syndrome Coronarien Aigu (SCA ST+ / Infarctus)** | **82/100** | 🟡 **B** | 📄 **ECG.pdf**<br>(P.16, P.18, P.24, P.26, P.28-29, P.32, P.35, P.41, P.50, P.54, P.58-60, P.64, P.66, P.70-71, P.77, P.84, P.89, P.91-92, P.97, P.99, P.101, P.103, P.107, P.109, P.111, P.115, P.121, P.123, P.127, P.130) | • CAT Dr_Kacem.pdf (P.1, P.3-5, P.7)<br>• Cardiologie_1.pdf (P.6, P.10, P.31-32, P.51) |
|  | **Œdème Aigu du Poumon (OAP cardiogénique / Urgence)** | **80/100** | 🟡 **B** | 📄 **Cardiologie_1.pdf**<br>(P.2, P.8-9, P.13, P.36-39, P.42) | • Urologie_.pdf (P.9, P.14, P.19, P.22, P.37, P.39-40)<br>• ECG.pdf (P.10, P.20, P.62-63, P.84, P.91) |
|  | **Urgence hypertensive & HTA maligne** | **76/100** | 🟡 **B** | 📄 **Entretiens_.pdf**<br>(P.33, P.35, P.39, P.42, P.88) | • CAT Gynécologie_(3).pdf (P.3, P.66-67)<br>• Cardiologie_1.pdf (P.2, P.37, P.42) |
|  | **Thrombose Veineuse Profonde (TVP / Phlébite)** | **74/100** | 🟡 **B** | 📄 **CAT Dr_Boughoufala.pdf**<br>(P.1-2, P.17, P.31) | • CAT Gynécologie_(3).pdf (P.42, P.46, P.66, P.84)<br>• 150 Ordonnances types.pdf (P.6, P.123) |
|  | **Péricardite aiguë bénigne** | **74/100** | 🟡 **B** | 📄 **Cardiologie_1.pdf**<br>(P.16, P.18) | • Maladies éruptives.pdf (P.2, P.5)<br>• Antibiotiques .pdf (P.28) |
|  | **Malaise vagal & Syncope (Orientation diagnostique)** | **71/100** | 🟡 **B** | 📄 **Cardiologie_1.pdf**<br>(P.2, P.8, P.11-12, P.24, P.53) | • 150 Ordonnances types.pdf (P.4, P.83)<br>• CAT Gynécologie_(3).pdf (P.2, P.12) |
|  | **Syndrome Coronarien Aigu sans sus-décalage (SCA ST- / Angor)** | **27/100** | 🔴 **C** | 📄 **Médicaments des Urgences_1.pdf**<br>(P.29, P.42) | • Médicaments des urgences .pdf (P.9-10) |

### 🩺 Infectiologie (10 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Paludisme d'importation (Accès palustre)** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.1, P.4, P.6, P.19, P.23-24, P.26, P.31, P.34, P.36-38, P.40-42, P.44, P.47-50, P.52-59, P.61, P.64-69, P.71, P.75, P.78, P.86, P.89-90, P.92-93, P.95, P.97, P.103) | • Antibiotiques .pdf (P.1-3, P.5, P.8, P.12-13, P.18, P.21, P.28)<br>• CAT Dr_Boughoufala.pdf (P.1, P.4-5, P.7, P.10, P.13, P.15, P.26-27) |
|  | **Varicelle de l'enfant & de l'adulte** | **100/100** | 🟢 **A** | 📄 **Dermatologie_.pdf**<br>(P.4, P.24, P.32, P.34, P.37, P.39, P.51, P.68, P.73, P.77, P.84, P.91-92) | • 150 Ordonnances types.pdf (P.3, P.6, P.40, P.48, P.84, P.87, P.129, P.142, P.154)<br>• Entretiens_.pdf (P.4, P.82, P.95, P.118-120) |
|  | **Angine aiguë bactérienne & virale (TDR)** | **96/100** | 🟢 **A** | 📄 **2Médicaments.pdf**<br>(P.1, P.3, P.5, P.7-8, P.14-15, P.17, P.23-25) | • 1Médicaments(1).pdf (P.7-9, P.32, P.34-38)<br>• 1Antibiotiques.pdf (P.1-7) |
|  | **Grippe saisonnière & Syndrome grippal** | **96/100** | 🟢 **A** | 📄 **150 Ordonnances types.pdf**<br>(P.4, P.11-12, P.23, P.25, P.50, P.73, P.78, P.104, P.113, P.116, P.126, P.131) | • Médicaments1 .pdf (P.8-9, P.11-13, P.26-31)<br>• ORL.pdf (P.3, P.7-8, P.27, P.36, P.42, P.47, P.53) |
|  | **Fièvre typhoïde & Salmonelloses majeures** | **90/100** | 🟢 **A** | 📄 **Entretiens_.pdf**<br>(P.6, P.67, P.103, P.130, P.153) | • Antibiotiques .pdf (P.1, P.19-20)<br>• Antibiotiques 1.pdf (P.2, P.4) |
|  | **Méningites infectieuses aiguës** | **85/100** | 🟢 **A** | 📄 **Neurologie.pdf**<br>(P.2, P.13, P.29, P.31-32) | • Antibiotiques .pdf (P.11, P.18, P.23)<br>• CAT Gynécologie_(3).pdf (P.44, P.50, P.87) |
|  | **Sepsis & Choc septique** | **81/100** | 🟡 **B** | 📄 **CAT Dr_Boughoufala.pdf**<br>(P.4-5, P.7, P.26-27, P.30) | • CAT Urgences(1).pdf (P.2, P.19-20, P.23-25)<br>• Entretiens_.pdf (P.28, P.42, P.102, P.119) |
|  | **Brucellose aiguë & subaiguë (Fièvre de Malte)** | **57/100** | 🔴 **C** | 📄 **Entretiens_.pdf**<br>(P.7, P.130, P.132, P.156) | • Antibiotiques .pdf (P.11, P.13, P.23)<br>• Infectieux_.pdf (P.2, P.6, P.39) |
|  | **Tuberculose pulmonaire (BK)** | **57/100** | 🔴 **C** | 📄 **Antibiotiques .pdf**<br>(P.11, P.23, P.27) | • Infectieux_.pdf (P.3, P.39, P.47)<br>• Entretiens_.pdf (P.131-132) |
|  | **Infection par le VIH & Conduite post-exposition (AES)** | **54/100** | 🔴 **C** | 📄 **Entretiens_.pdf**<br>(P.57, P.73, P.97, P.130) | • CAT Dr_Abouimed_.pdf (P.3, P.48)<br>• Gastrologie_.pdf (P.33, P.54) |

### 🩺 Dermatologie (19 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Gale humaine & Pédiculose (Poux)** | **88/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.4, P.14, P.34, P.39, P.63, P.67, P.70, P.84, P.90, P.97, P.103) | • Dermatologie_.pdf (P.3, P.51-53, P.83, P.92)<br>• ECG.pdf (P.14, P.42, P.57, P.125) |
|  | **Brûlures thermiques cutanées (1er, 2ème, 3ème degré)** | **87/100** | 🟢 **A** | 📄 **Dermatologie_.pdf**<br>(P.2, P.10, P.12, P.15-16, P.23) | • 150 Ordonnances types.pdf (P.3, P.25-26, P.89, P.146)<br>• Ophtalmologie_.pdf (P.2-3, P.5-6, P.28) |
|  | **Érysipèle & Dermohypodermite bactérienne non nécrosante** | **86/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.4, P.7, P.9-11, P.18-19, P.23, P.29, P.36-39, P.61, P.86) | • ORL.pdf (P.4, P.7-8, P.11, P.29, P.48, P.51-53)<br>• Entretiens_.pdf (P.4, P.13, P.16, P.23, P.64, P.78-79, P.85) |
|  | **Impétigo croûteux & bulleux** | **83/100** | 🟡 **B** | 📄 **Dermatologie_.pdf**<br>(P.3, P.36, P.43, P.47-49, P.60-63, P.80-81, P.109) | • Antibiotiques .pdf (P.1, P.3, P.11, P.15, P.18, P.23, P.25-26, P.28)<br>• Rhumatologie_.pdf (P.5, P.13, P.25, P.45, P.53) |
|  | **Urticaire aiguë & Œdème de Quincke** | **81/100** | 🟡 **B** | 📄 **Entretiens_.pdf**<br>(P.4, P.84, P.93, P.119-120) | • Médicaments des Urgences_1.pdf (P.8, P.25, P.39, P.44)<br>• Dermatologie_.pdf (P.4, P.92, P.110) |
|  | **Acné vulgaire (Rétentionnelle & Inflammatoire)** | **74/100** | 🟡 **B** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.9, P.27, P.53-54, P.102-103) | • Infectieux_.pdf (P.7, P.14, P.16, P.19-20, P.34)<br>• CAT Dr_Kacem.pdf (P.12-13, P.21) |
|  | **Candidoses cutanéo-muqueuses (Muguet, Pli, Génital)** | **73/100** | 🟡 **B** | 📄 **Gynécologie_1.pdf**<br>(P.2, P.11-13, P.46, P.48) | • CAT Gynécologie_(3).pdf (P.6, P.59-60, P.83, P.102)<br>• ORL.pdf (P.2, P.15, P.18-20) |
|  | **Zona intercostal & ophtalmique** | **67/100** | 🟡 **B** | 📄 **Infectieux_.pdf**<br>(P.3, P.52, P.55) | • Ophtalmologie_.pdf (P.2, P.30-31)<br>• CAT Gynécologie_(3).pdf (P.63, P.91) |
|  | **Furoncle, Furonculose & Anthrax** | **65/100** | 🟡 **B** | 📄 **150 Ordonnances types.pdf**<br>(P.3-4, P.14, P.69) | • Dermatologie_.pdf (P.3, P.48-49)<br>• CAT Dermatologie_(1).pdf (P.9, P.11) |
|  | **Panaris & Phlegmon des gaines** | **60/100** | 🟡 **B** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.36-37) | • Dermatologie_.pdf (P.3, P.80)<br>• Rhumatologie_.pdf (P.3, P.50) |
|  | **Eczéma de contact & Dermatite atopique** | **48/100** | 🔴 **C** | 📄 **Dermatologie_.pdf**<br>(P.2, P.24, P.32, P.34, P.36-37, P.88, P.92) | • 150 Ordonnances types.pdf (P.4, P.61, P.95)<br>• Entretiens_.pdf (P.133, P.139) |
|  | **Herpès labial & génital** | **46/100** | 🔴 **C** | 📄 **Infectieux_.pdf**<br>(P.52-53, P.55) | • Dermatologie_.pdf (P.3, P.58)<br>• Gynécologie_1.pdf (P.3, P.37) |
|  | **Balanite & Posthite aiguë** | **45/100** | 🔴 **C** | 📄 **150 Ordonnances types.pdf**<br>(P.3, P.18) | • Pédiatrie_.pdf (P.2, P.11)<br>• CAT Dr_Kacem.pdf (P.15) |
|  | **Leishmaniose cutanée (Bouton d'Orient)** | **40/100** | 🔴 **C** | 📄 **Dermatologie_.pdf**<br>(P.3, P.68-70) | • Entretiens_.pdf (P.6, P.143-144)<br>• 150 Ordonnances types.pdf (P.5, P.97) |
|  | **Psoriasis vulgaire en plaques** | **35/100** | 🔴 **C** | 📄 **Dermatologie_.pdf**<br>(P.4, P.87, P.92, P.95-96, P.98-99) | • CAT Dermatologie_(1).pdf (P.5)<br>• CAT Gynécologie_(3).pdf (P.32) |
|  | **Dermatophytoses de la peau glabre & Intertrigo** | **32/100** | 🔴 **C** | 📄 **Dermatologie_.pdf**<br>(P.3, P.31, P.55-56, P.64-65, P.77, P.92, P.105-106) | • 150 Ordonnances types.pdf (P.5, P.92)<br>• CAT Dermatologie_.pdf (P.7) |
|  | **Teignes du cuir chevelu** | **32/100** | 🔴 **C** | 📄 **Dermatologie_.pdf**<br>(P.4, P.56, P.64-65, P.77, P.103-107) | • 150 Ordonnances types.pdf (P.6, P.143)<br>• CAT Dermatologie_.pdf (P.7) |
|  | **Ulcère de jambe veineux & artériel** | **9/100** | 🔴 **C** | 📄 **Dermatologie_.pdf**<br>(P.43) | - |
|  | **Pelade & Alopécies** | **0/100** | 🔴 **C** | *(À découper)* | - |

### 🩺 Néphrologie - Urologie (10 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Colique néphrétique aiguë lithiasique** | **90/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.9, P.15, P.20, P.28, P.31-32, P.49, P.54, P.63-65, P.69-70, P.74, P.85, P.88-90, P.97) | • Entretiens_.pdf (P.4, P.20, P.24, P.35, P.68-69, P.77, P.80, P.87, P.95, P.109, P.118)<br>• Rhumatologie_.pdf (P.7, P.16, P.25, P.28-29, P.31, P.35, P.39, P.56, P.59, P.67, P.69) |
|  | **Cystite aiguë récidivante ou à risque de complication** | **86/100** | 🟢 **A** | 📄 **Urologie_.pdf**<br>(P.6-7, P.17, P.24, P.28-33, P.44, P.48) | • Entretiens_.pdf (P.12, P.37, P.44, P.47, P.60, P.69, P.102-103, P.123)<br>• 150 Ordonnances types.pdf (P.34, P.48, P.72, P.74, P.89, P.112, P.151) |
|  | **Insuffisance rénale aiguë (IRA fonctionnelle & obstructive)** | **85/100** | 🟢 **A** | 📄 **Urologie_.pdf**<br>(P.2, P.8, P.14, P.35, P.37, P.39, P.43) | • CAT Dr_Boughoufala.pdf (P.4, P.6, P.9, P.25)<br>• CAT Urgences(1).pdf (P.21-24) |
|  | **Hypertrophie Bénigne de la Prostate (HBP / Adénome)** | **83/100** | 🟡 **B** | 📄 **Médicaments des urgences1.pdf**<br>(P.3, P.7, P.11) | • Urologie_.pdf (P.24, P.29, P.45)<br>• 150 Ordonnances types.pdf (P.4, P.82) |
|  | **Pyélonéphrite aiguë simple (PNA)** | **81/100** | 🟡 **B** | 📄 **Urologie_.pdf**<br>(P.2, P.4, P.6-7, P.17, P.24, P.28-33, P.44, P.48, P.50) | • Entretiens_.pdf (P.5, P.12, P.37, P.44, P.47, P.60, P.67, P.69, P.102-103, P.123)<br>• 150 Ordonnances types.pdf (P.6, P.34, P.48, P.72, P.74, P.89, P.112, P.130-131, P.151) |
|  | **Cystite aiguë simple de la femme** | **27/100** | 🔴 **C** | 📄 **Urologie_.pdf**<br>(P.23, P.29, P.32) | • 150 Ordonnances types.pdf (P.89)<br>• Entretiens_.pdf (P.37) |
|  | **Orchi-épididymite aiguë & Torsion du cordon** | **26/100** | 🔴 **C** | 📄 **CAT Pédiatrie_.pdf**<br>(P.6) | • Urologie_.pdf (P.47) |
|  | **Rétention Aiguë d'Urine (RAU & Globe vésical)** | **23/100** | 🔴 **C** | 📄 **Urologie_.pdf**<br>(P.37-38) | • Entretiens_.pdf (P.170)<br>• Gynécologie_1.pdf (P.35) |
|  | **Prostatite aiguë bactérienne de l'homme** | **21/100** | 🔴 **C** | 📄 **150 Ordonnances types.pdf**<br>(P.6, P.131) | • CAT Gynécologie_(3).pdf (P.37) |
|  | **Hématurie macroscopique (Bilan étiologique & Gravité)** | **10/100** | 🔴 **C** | 📄 **Urologie_.pdf**<br>(P.2, P.14, P.17, P.37) | - |

### 🩺 Pédiatrie (9 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Bronchiolite aiguë du nourrisson** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.35-38, P.40-41, P.44, P.48, P.53, P.60-61, P.67, P.78, P.80) | • Entretiens_.pdf (P.2, P.11, P.27, P.82, P.129, P.144, P.152, P.157)<br>• Antibiotiques 1.pdf (P.1-5) |
|  | **Convulsions fébriles simples de l'enfant** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.34-37, P.40-41, P.43-44, P.48-50, P.53, P.55, P.57-62, P.64-65, P.72, P.75-76, P.78-79, P.82-83, P.86-87, P.89-91, P.99, P.102-104) | • Entretiens_.pdf (P.10, P.12, P.27, P.37, P.51, P.59, P.69, P.72, P.76, P.78, P.83, P.85-87, P.89, P.94, P.96, P.98, P.105, P.108, P.122, P.124-125, P.127, P.134, P.144, P.146, P.152, P.157)<br>• Médicaments_3.pdf (P.5-8, P.18-20, P.22, P.25, P.27-28, P.33, P.41, P.52-53, P.55, P.58, P.60, P.62, P.65, P.67, P.70, P.73, P.76) |
|  | **Gastro-entérite aiguë & Déshydratation du nourrisson** | **86/100** | 🟢 **A** | 📄 **Entretiens_.pdf**<br>(P.5, P.43, P.73-74, P.102, P.108, P.119, P.126-127) | • Gastrologie_.pdf (P.33-35, P.49-50, P.77, P.90)<br>• Pédiatrie_.pdf (P.2, P.16-17, P.21, P.45-46, P.48) |
|  | **Laryngite aiguë sous-glottique (Stridor & Toux aboyante)** | **60/100** | 🟡 **B** | 📄 **CAT Pédiatrie_1.pdf**<br>(P.8, P.10) | • CAT Pédiatrie_(2).pdf (P.3)<br>• CAT Pédiatrie_(3).pdf (P.25) |
|  | **Fièvre isolée chez le nourrisson de moins de 3 mois** | **42/100** | 🔴 **C** | 📄 **Antibiotiques .pdf**<br>(P.8) | • Antibiotiques1.pdf (P.3)<br>• CAT Pédiatrie_(4).pdf (P.2) |
|  | **Érythème fessier du nourrisson & Dermite du siège** | **40/100** | 🔴 **C** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.14) | • CAT Pédiatrie_(4).pdf (P.2) |
|  | **Poussée dentaire & Fièvre modérée** | **40/100** | 🔴 **C** | 📄 **Pédiatrie_.pdf**<br>(P.3, P.47) | • 1Médicaments en Pédiatrie .pdf (P.4)<br>• CAT Dr_Boughoufala.pdf (P.26) |
|  | **Anémie ferriprive du nourrisson & de l'enfant** | **38/100** | 🔴 **C** | 📄 **Hématologie.pdf**<br>(P.11, P.14, P.19) | • Trt Anémie_.pdf (P.2, P.4)<br>• Bilans_medicale.pdf (P.1) |
|  | **Rachitisme carentiel & Prévention par Vitamine D** | **4/100** | 🔴 **C** | 📄 **Endocrinologie_.pdf**<br>(P.35) | • Réflexes.pdf (P.3) |

### 🩺 ORL & Stomatologie (8 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Otite moyenne aiguë purulente & congestive (OMA)** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.8, P.16, P.24, P.32, P.34, P.36-37, P.39, P.44, P.46-48, P.50, P.52, P.54-55, P.60, P.63, P.73, P.75-76, P.81, P.86, P.92-93, P.102-103) | • Entretiens_.pdf (P.3, P.18, P.20-21, P.35, P.49, P.54, P.61-62, P.66, P.72, P.88, P.90, P.115, P.150, P.166, P.174)<br>• 1Médicaments(1).pdf (P.7, P.9-10, P.13, P.16, P.19-21, P.32, P.37-38) |
|  | **Aphtose buccale & Gingivostomatite herpétique** | **63/100** | 🟡 **B** | 📄 **ORL.pdf**<br>(P.2, P.4, P.11, P.13-15, P.18, P.30-32) | • Infectieux_.pdf (P.36, P.48-49, P.51, P.53, P.55)<br>• Médecine interne_.pdf (P.3-5, P.7) |
|  | **Rage de dent & Abcès dentaire (Urgence stomatologique)** | **46/100** | 🔴 **C** | 📄 **1Médicaments(1).pdf**<br>(P.32-33, P.38-39) | • Médicaments1 .pdf (P.4-5)<br>• ORL.pdf (P.2, P.4) |
|  | **Otite externe aiguë & Otite baignade** | **43/100** | 🔴 **C** | 📄 **ORL.pdf**<br>(P.2, P.33-34, P.37) | • CAT ORL.pdf (P.33, P.35-36)<br>• Médicaments1 .pdf (P.20-21) |
|  | **Épistaxis antérieure & postérieure de l'adulte** | **42/100** | 🔴 **C** | 📄 **Entretiens_.pdf**<br>(P.2, P.17, P.33) | • Hématologie.pdf (P.7, P.29)<br>• ORL.pdf (P.2, P.21) |
|  | **Sinusite aiguë maxillaire de l'adulte** | **13/100** | 🔴 **C** | 📄 **150 Ordonnances types.pdf**<br>(P.6, P.140) | - |
|  | **Bouchon de cérumen (Conduite & Extraction)** | **5/100** | 🔴 **C** | 📄 **150 Ordonnances types.pdf**<br>(P.3, P.20) | • Dermatologie_1.pdf (P.58)<br>• Médicaments1 .pdf (P.24) |
|  | **Vertige Positionnel Paroxystique Bénin (VPPB)** | **0/100** | 🔴 **C** | *(À découper)* | - |

### 🩺 Ophtalmologie (6 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Conjonctivite aiguë bactérienne, virale & allergique** | **67/100** | 🟡 **B** | 📄 **Ophtalmologie_.pdf**<br>(P.2-3, P.9, P.11-12, P.14-15) | • 150 Ordonnances types.pdf (P.3, P.37-40)<br>• Entretiens_.pdf (P.5, P.124-125, P.133, P.155) |
|  | **Kératite aiguë & Ulcère cornéen (Fluorescéine)** | **40/100** | 🔴 **C** | 📄 **Entretiens_.pdf**<br>(P.64-65, P.155) | • Ophtalmologie_.pdf (P.12-13, P.28)<br>• Gastrologie_.pdf (P.51, P.87) |
|  | **Corps étranger cornéen & Traumatisme oculaire** | **40/100** | 🔴 **C** | 📄 **Ophtalmologie_.pdf**<br>(P.5, P.9-10, P.12, P.21) | • Neurologie.pdf (P.37-38)<br>• CAT Ophtalmologie_.pdf (P.7) |
|  | **Glaucome Aigu par Fermeture de l'Angle (GAFA / Urgence)** | **27/100** | 🔴 **C** | 📄 **CAT Urgences(1).pdf**<br>(P.14) | • Psychotropes .pdf (P.4) |
|  | **Chalazion & Orgelet (Diagnostic différentiel & CAT)** | **26/100** | 🔴 **C** | 📄 **150 Ordonnances types.pdf**<br>(P.3, P.5, P.30, P.114-115) | • Ophtalmologie_.pdf (P.2, P.7, P.23-24)<br>• CAT Ophtalmologie_.pdf (P.6, P.9) |
|  | **Blépharite aiguë & chronique** | **20/100** | 🔴 **C** | 📄 **Ophtalmologie_.pdf**<br>(P.2-3, P.24) | • 150 Ordonnances types.pdf (P.3, P.19)<br>• Antibiotiques1.pdf (P.18) |

### 🩺 Neurologie & Psychiatrie (10 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Accident Vasculaire Cérébral ischémique & AIT (FAST)** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.6, P.8, P.14-16, P.18, P.20, P.22, P.26, P.28-29, P.31-37, P.39-48, P.51-61, P.63, P.65-68, P.70-76, P.78-95, P.98-104) | • Entretiens_.pdf (P.7, P.9-10, P.12, P.15-16, P.18-21, P.23-25, P.32, P.34-36, P.44, P.46, P.48, P.50, P.52, P.54, P.57, P.63-66, P.69-70, P.72, P.74, P.76, P.79-82, P.84, P.88, P.90-91, P.93, P.95, P.97, P.101, P.104-105, P.107-108, P.110, P.115-118, P.125, P.134, P.143-144, P.154, P.156-158, P.162-164, P.166)<br>• Dermatologie_.pdf (P.5-6, P.8, P.11-12, P.14-15, P.17, P.19, P.21, P.23-24, P.26, P.28-29, P.34, P.39, P.41, P.43, P.45, P.47-48, P.51, P.55-56, P.58, P.60, P.62, P.64, P.67, P.69-70, P.72, P.75, P.77, P.79-81, P.83-85, P.87, P.89-91, P.95, P.98, P.100-101, P.103, P.105-106, P.109-111, P.114-115) |
|  | **Sciatique & Cruralgie commune (Lombosciatique)** | **90/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.9, P.15, P.20, P.28, P.31-32, P.49, P.54, P.63-65, P.69-70, P.74, P.85, P.88-90, P.97) | • Rhumatologie_.pdf (P.3, P.7, P.16, P.25, P.28-29, P.31, P.35, P.39, P.56, P.59, P.61, P.67, P.69)<br>• Entretiens_.pdf (P.20, P.24, P.35, P.68-69, P.77, P.80, P.87, P.95, P.109, P.118) |
|  | **Névralgie cervico-brachiale (NCB)** | **90/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.9, P.15, P.20, P.28, P.31-32, P.49, P.54, P.63-65, P.69-70, P.74, P.85, P.88-90, P.97) | • Entretiens_.pdf (P.20, P.24, P.35, P.68-69, P.77, P.80, P.87, P.95, P.99, P.109, P.118)<br>• Rhumatologie_.pdf (P.7, P.16, P.25, P.28-29, P.31, P.35, P.39, P.56, P.59, P.67, P.69) |
|  | **Syndrome confusionnel aigu du sujet âgé** | **81/100** | 🟡 **B** | 📄 **Entretiens_.pdf**<br>(P.5, P.43, P.73-74, P.102, P.119, P.126-127) | • Pédiatrie_.pdf (P.2, P.16, P.21, P.45-46, P.48)<br>• Gastrologie_.pdf (P.33-34, P.49, P.77) |
|  | **Crise d'épilepsie généralisée & État de mal épileptique** | **71/100** | 🟡 **B** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.35, P.41, P.57, P.61-62, P.75, P.91, P.96-97) | • Médicaments des Urgences_1.pdf (P.20-21, P.51)<br>• Neurologie.pdf (P.2, P.13, P.20) |
|  | **Épisode Dépressif Majeur (EDM & Évaluation suicidaire)** | **69/100** | 🟡 **B** | 📄 **ORL.pdf**<br>(P.12-13, P.19) | • Dermatologie_.pdf (P.12, P.55)<br>• Entretiens_.pdf (P.97, P.165) |
|  | **Céphalée de tension & Migraine aiguë** | **68/100** | 🟡 **B** | 📄 **150 Ordonnances types.pdf**<br>(P.5, P.103-106) | • Neurologie.pdf (P.2, P.11, P.21-22)<br>• 2Médicaments.pdf (P.26, P.38-39) |
|  | **Crise d'angoisse aiguë & Attaque de panique** | **61/100** | 🟡 **B** | 📄 **Entretiens_.pdf**<br>(P.3, P.56) | • Maladies éruptives.pdf (P.4, P.9)<br>• Neurologie.pdf (P.2, P.4) |
|  | **Insomnie aiguë & Troubles du sommeil** | **52/100** | 🔴 **C** | 📄 **Autres CAT.pdf**<br>(P.2, P.9, P.16-17) | • 150 Ordonnances types.pdf (P.5, P.90-91)<br>• CAT Gynécologie_(3).pdf (P.42) |
|  | **Paralysie faciale périphérique a frigore** | **31/100** | 🔴 **C** | 📄 **Entretiens_.pdf**<br>(P.3, P.53, P.65) | • Neurologie.pdf (P.2, P.6, P.36)<br>• 150 Ordonnances types.pdf (P.5) |

### 🩺 Urgences & Réanimation (10 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Arrêt Cardio-Respiratoire (ACR & Réanimation cardio-pulmonaire)** | **95/100** | 🟢 **A** | 📄 **2Médicaments.pdf**<br>(P.12-17, P.25, P.53) | • Ophtalmologie_.pdf (P.2, P.5, P.9, P.11-12, P.14, P.16)<br>• Entretiens_.pdf (P.25, P.27, P.124-125, P.152, P.170) |
|  | **Choc Anaphylactique (Grade III / IV)** | **86/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.31, P.50, P.53, P.69, P.97) | • Réanimation_.pdf (P.2, P.9, P.14, P.18-19)<br>• CAT Dr_Boughoufala.pdf (P.6-7, P.24) |
|  | **Coma non traumatique & Évaluation de Glasgow** | **85/100** | 🟢 **A** | 📄 **Entretiens_.pdf**<br>(P.3, P.6, P.35, P.49, P.61-62, P.100, P.134, P.166) | • CAT Dr_Boughoufala.pdf (P.6, P.10, P.14-15, P.17, P.28)<br>• CAT Urgences(1).pdf (P.3, P.19-20, P.25) |
|  | **Hypoglycémie sévère chez le diabétique** | **80/100** | 🟡 **B** | 📄 **Entretiens_.pdf**<br>(P.30-31, P.43, P.46, P.49, P.51-53, P.56-57, P.59, P.61, P.65, P.100-101) | • ECG.pdf (P.12, P.14, P.50, P.70, P.102, P.114, P.117, P.124, P.130)<br>• Neurologie.pdf (P.4, P.6, P.10, P.13, P.16, P.37, P.39, P.42) |
|  | **Hyperkaliémie menaçante (Signes ECG & Traitement)** | **66/100** | 🟡 **B** | 📄 **Urologie_.pdf**<br>(P.19, P.35, P.37, P.39, P.43) | • Troubles ioniques.pdf (P.2-3, P.19)<br>• Médicaments des urgences1.pdf (P.2, P.10) |
|  | **Choc hypovolémique & Hémorragique** | **48/100** | 🔴 **C** | 📄 **Réanimation_.pdf**<br>(P.18-19) | • CAT Dr_Boughoufala.pdf (P.31)<br>• CAT Gynécologie_(2).pdf (P.7) |
|  | **Intoxication au Monoxyde de Carbone (CO)** | **29/100** | 🔴 **C** | 📄 **CAT Dr_Boughoufala.pdf**<br>(P.28) | - |
|  | **Intoxication aux Psychotropes (Benzodiazépines / Antidépresseurs)** | **28/100** | 🔴 **C** | 📄 **CAT Urgences(1).pdf**<br>(P.20, P.25) | • Médicaments des Urgences_1.pdf (P.20)<br>• Médicaments des urgences1.pdf (P.12) |
|  | **Morsure de vipère & Piqûre de scorpion (Envenimation)** | **22/100** | 🔴 **C** | 📄 **Réanimation_.pdf**<br>(P.2, P.14) | - |
|  | **Intoxication médicamenteuse aiguë au Paracétamol** | **18/100** | 🔴 **C** | 📄 **Antibiotiques .pdf**<br>(P.27) | - |

### 🩺 Rhumatologie & Traumatologie (6 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Lombalgie aiguë & Lumbago** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.9, P.15, P.20, P.28, P.31-32, P.49, P.54, P.63-65, P.69-70, P.74, P.82-83, P.85, P.88-90, P.97) | • Entretiens_.pdf (P.12, P.20, P.24, P.35, P.68-69, P.77-78, P.80, P.87, P.95-96, P.109, P.118, P.122)<br>• Rhumatologie_.pdf (P.3, P.7, P.16, P.25, P.27-29, P.31, P.35, P.39, P.44, P.56, P.59, P.67, P.69) |
|  | **Goutte aiguë (Accès microcristallin)** | **100/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.1, P.5, P.9, P.15, P.20, P.25, P.28, P.31-32, P.49, P.54, P.63-65, P.68-70, P.74, P.85, P.88-90, P.96-97, P.103-104) | • Rhumatologie_.pdf (P.2, P.7, P.16, P.25, P.28-29, P.31, P.35-39, P.56, P.59, P.67, P.69)<br>• Médicaments1.pdf (P.9, P.13, P.15, P.26-36) |
|  | **Entorse de la cheville & Critères d'Ottawa** | **90/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.9, P.15, P.20, P.28, P.31-32, P.49, P.54, P.63-65, P.69-70, P.74, P.85, P.88-90, P.97) | • Rhumatologie_.pdf (P.7, P.16, P.25, P.28-29, P.31, P.35, P.39, P.56, P.59, P.67, P.69)<br>• Entretiens_.pdf (P.20, P.24, P.35, P.68-69, P.77, P.80, P.87, P.95, P.109, P.118) |
|  | **Arthrite septique aiguë (Urgence rhumatologique)** | **86/100** | 🟢 **A** | 📄 **Ophtalmologie_.pdf**<br>(P.5, P.8-12, P.15, P.21) | • CAT ORL.pdf (P.12, P.19, P.21-23, P.30)<br>• CAT Urgences(1).pdf (P.18-20, P.22-24) |
|  | **Gonarthrose & Coxarthrose douloureuse** | **52/100** | 🔴 **C** | 📄 **Rhumatologie_.pdf**<br>(P.2, P.6-7, P.11, P.34) | • Radiographies_.pdf (P.21, P.25, P.48)<br>• Médicaments en Gastrologie.pdf (P.9) |
|  | **Tendinopathie de la coiffe des rotateurs (Épaule douloureuse)** | **0/100** | 🔴 **C** | 📄 **Neurologie.pdf**<br>(P.9) | • Radiographies_.pdf (P.48)<br>• Rhumatologie_.pdf (P.68) |

### 🩺 Gynécologie - Obstétrique (8 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Hypertension artérielle gravidique & Prééclampsie** | **81/100** | 🟡 **B** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.3, P.8, P.22, P.24-25, P.93-94) | • Entretiens_.pdf (P.3, P.33, P.38-39, P.166-167)<br>• Gynécologie_1.pdf (P.3, P.24, P.38, P.59-60) |
|  | **Syndrome prémenstruel & Dysménorrhées primaires** | **80/100** | 🟡 **B** | 📄 **Contraception_.pdf**<br>(P.7-9, P.11, P.13-17, P.21, P.26, P.29, P.31-32, P.49, P.54, P.61-62, P.73, P.77, P.84, P.86-88) | • CAT Gynécologie_(3).pdf (P.11, P.20, P.23, P.26, P.28, P.33-34, P.48, P.56, P.63, P.77, P.90, P.92, P.95)<br>• 2Médicaments.pdf (P.45-51) |
|  | **Prescription de Contraception régulière & Oestro-progestatifs** | **70/100** | 🟡 **B** | 📄 **Contraception_.pdf**<br>(P.9, P.37, P.43, P.84, P.86, P.88) | • CAT Dr_Boughoufala.pdf (P.1-3)<br>• Cardiologie_1.pdf (P.5, P.57) |
|  | **Métrorragies du 1er trimestre & Suspicion de GEU** | **64/100** | 🟡 **B** | 📄 **Contraception_.pdf**<br>(P.46, P.50, P.52, P.56, P.84) | • Gynécologie_1.pdf (P.5, P.7, P.28, P.31-32)<br>• Dermatologie_.pdf (P.18, P.76, P.79, P.100) |
|  | **Leucorrhées & Vaginites infectieuses (Mycose / Vaginose / Trichomonas)** | **62/100** | 🟡 **B** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.5-6, P.39, P.58-59, P.83, P.98) | • 150 Ordonnances types.pdf (P.5, P.87-88, P.98-100)<br>• CAT Dr_Kacem.pdf (P.11-15) |
|  | **Infections urinaires chez la femme enceinte (BBU / Cystite / PNA)** | **45/100** | 🔴 **C** | 📄 **Antibiotiques .pdf**<br>(P.9) | • Antibiotiques1.pdf (P.3)<br>• Entretiens_.pdf (P.103) |
|  | **Contraception d'urgence (Pilule du lendemain)** | **30/100** | 🔴 **C** | 📄 **Contraception_.pdf**<br>(P.12, P.32, P.72-75) | • Antibiotiques1.pdf (P.21) |
|  | **Mastite aiguë & Engorgement mammaire du post-partum** | **27/100** | 🔴 **C** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.14-16) | • Gynécologie_1.pdf (P.2, P.28) |

### 🩺 Endocrinologie (5 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Carence en Vitamine D3 chez l'adulte** | **65/100** | 🟡 **B** | 📄 **ECG.pdf**<br>(P.29, P.89, P.95, P.103, P.105, P.107, P.121) | • Entretiens_.pdf (P.58, P.122, P.163)<br>• Médicaments des Urgences_1.pdf (P.12, P.29-30) |
|  | **Hyperthyroïdie & Suspicion de Maladie de Basedow** | **60/100** | 🟡 **B** | 📄 **Cardiologie_1.pdf**<br>(P.7, P.9, P.55) | • ECG.pdf (P.9, P.12, P.125)<br>• Endocrinologie_.pdf (P.2, P.29-30) |
|  | **Hypothyroïdie fruste & avérée (Hashimoto)** | **58/100** | 🔴 **C** | 📄 **Endocrinologie_.pdf**<br>(P.2, P.13, P.31-33) | • Cardiologie_1.pdf (P.12, P.21, P.27)<br>• CAT Gynécologie_(3).pdf (P.65-66) |
|  | **Diabète de type 2 (Mise en route du traitement & ADO)** | **44/100** | 🔴 **C** | 📄 **Endocrinologie_.pdf**<br>(P.8, P.11, P.16, P.26-27) | • Dermatologie_.pdf (P.48, P.55, P.108)<br>• Cardiologie_1.pdf (P.22, P.43) |
|  | **Dyslipidémies & Prévention cardiovasculaire (Statines)** | **12/100** | 🔴 **C** | 📄 **Cardiologie_1.pdf**<br>(P.2, P.16, P.21) | - |

### 🩺 Hématologie (3 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Thrombopénie isolée & Purpura (Orientation diagnostique)** | **75/100** | 🟡 **B** | 📄 **Entretiens_.pdf**<br>(P.39-41, P.145, P.150, P.167) | • Infectieux_.pdf (P.13, P.15, P.17, P.26)<br>• Hématologie.pdf (P.2, P.29-30) |
|  | **Anémie mégaloblastique (Carence en B12 & Folates)** | **36/100** | 🔴 **C** | 📄 **Hématologie.pdf**<br>(P.10, P.17-18) | • Formes d_administration des médicaments.pdf (P.1-2)<br>• Bilans_medicale.pdf (P.1) |
|  | **Anémie par carence martiale (Ferriprive)** | **31/100** | 🔴 **C** | 📄 **Trt Anémie_.pdf**<br>(P.2, P.4) | • 150 Ordonnances types.pdf (P.141)<br>• CAT Gynécologie_(3).pdf (P.57) |

### 🩺 Thérapeutique & Pharmacologie (7 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Interprétation de l'Abdomen Sans Préparation (ASP)** | **95/100** | 🟢 **A** | 📄 **ECG.pdf**<br>(P.4, P.18, P.20, P.22, P.28-29, P.33, P.44, P.46, P.50, P.89, P.95, P.99, P.103, P.107, P.112, P.115, P.120-121, P.127, P.132) | • Gastrologie_.pdf (P.20, P.42, P.47, P.58-59, P.61, P.63, P.68, P.77, P.85, P.87)<br>• 150 Ordonnances types.pdf (P.11, P.34, P.46-47, P.113, P.125, P.136) |
|  | **Anti-inflammatoires non stéroïdiens (AINS) : Règles de prescription & Sécurité** | **90/100** | 🟢 **A** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.9, P.11, P.15, P.20, P.28, P.31-33, P.49-50, P.54, P.63-65, P.69-70, P.74, P.85, P.88-90, P.97) | • Rhumatologie_.pdf (P.7, P.16, P.25, P.28-29, P.31, P.35, P.39, P.47, P.56, P.59, P.67-69)<br>• Entretiens_.pdf (P.20, P.24, P.35, P.68-69, P.77, P.80, P.87, P.95, P.109, P.118) |
|  | **Antibiothérapie probabiliste en médecine générale (Guide de bon usage)** | **79/100** | 🟡 **B** | 📄 **2Médicaments.pdf**<br>(P.12-17) | • CAT Gynécologie_(3).pdf (P.38, P.44, P.61, P.69, P.78, P.86)<br>• Antibiotiques .pdf (P.1, P.13, P.15, P.27-28) |
|  | **Interprétation pratique de l'ECG en situation d'urgence** | **59/100** | 🔴 **C** | 📄 **CAT Gynécologie_(3).pdf**<br>(P.31-32, P.67, P.71-72, P.97) | • Médicaments des urgences1.pdf (P.2, P.5-6, P.11)<br>• Troubles ioniques.pdf (P.1, P.14, P.18) |
|  | **Interprétation de la Radiographie Thoracique face/profil** | **50/100** | 🔴 **C** | 📄 **CAT Dr_Boughoufala.pdf**<br>(P.1, P.18) | • CAT Urgences(1).pdf (P.4)<br>• Radio thoracique_.pdf (P.5) |
|  | **Prescription médicamenteuse chez la femme enceinte & Allaitement (CRAT)** | **36/100** | 🔴 **C** | 📄 **Maladies éruptives.pdf**<br>(P.2, P.5) | • Infectieux_.pdf (P.44)<br>• Médicaments et Grossesse.pdf (P.8) |
|  | **Prise en charge de la douleur aiguë & Paliers antalgiques OMS** | **0/100** | 🔴 **C** | *(À découper)* | - |

### 🩺 Administratif & Législation (5 fiches)

| Suivi | Titre Pathologie / Conduite | Score | Grade | Source Principale (Pages) | Sources Complémentaires |
| :---: | :--- | :---: | :---: | :--- | :--- |
|  | **Rédaction d'un certificat médical initial de constatation (CBU / ITT)** | **87/100** | 🟢 **A** | 📄 **Entretiens_.pdf**<br>(P.12, P.37, P.44, P.47, P.60, P.69, P.102-103, P.123, P.133, P.136, P.159) | • Urologie_.pdf (P.6-7, P.17, P.24, P.28-33, P.44, P.48)<br>• Certificats_.pdf (P.1-8, P.10, P.13-14) |
|  | **Rédaction d'un certificat de non contre-indication au sport** | **51/100** | 🔴 **C** | 📄 **CAT Dr_Kacem.pdf**<br>(P.14) | • CAT Gynécologie_(3).pdf (P.72)<br>• Certificats_.pdf (P.4) |
|  | **Rédaction d'une lettre d'orientation médicale & adressage confrère** | **29/100** | 🔴 **C** | 📄 **CAT Pédiatrie_.pdf**<br>(P.1) | - |
|  | **Rédaction d'un certificat de bonne santé & d'aptitude à l'embauche** | **18/100** | 🔴 **C** | 📄 **Réanimation_.pdf**<br>(P.4) | - |
|  | **Rédaction d'un certificat d'accident du travail (Initial, Prolongation, Guérison)** | **0/100** | 🔴 **C** | 📄 **Infectieux_.pdf**<br>(P.5) | • certificat accident travail.pdf (P.1) |

---

*Document officiel Dr.CAT — Architecture RAG & Moteur Clinique Offline.* 
*Auteur & Médecin Concepteur : Dr. Kibeche Ali Dia Eddine*
