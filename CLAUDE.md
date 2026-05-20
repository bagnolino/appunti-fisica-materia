# CLAUDE.md — Appunti di Fisica della Materia

## Progetto

Dispensa universitaria in LaTeX per il corso di Istituzioni di Fisica della Materia,
Università di Padova, CdL in Fisica, A.A. 2025/2026 (Prof. Cinzia Sada).
Il progetto è in italiano. La trascrizione parte dagli appunti a mano di Stefano Bastianello.

**Struttura cartelle:**
```
/
├── main.tex
├── preamble.tex          ← stile, pacchetti, ambienti personalizzati
├── chapters/
│   ├── chapter1.tex      ← Atomo di Idrogeno
│   ├── chapter2.tex      ← Atomo di Elio
│   ├── chapter3.tex      ← ...
│   └── chapter4.tex      ← ...
└── figures/              ← immagini PNG incluse con \includegraphics
```

## Compilazione

Per compilare usa **sempre** il Makefile, non invocare `pdflatex` direttamente:

- `make` o `make pdf` → build standard con `latexmk -pdf -bibtex -quiet main.tex`
- `make watch` → ricompilazione continua (`latexmk -pvc`)
- `make clean` → pulizia artefatti

---

## Compito principale

Quando ricevi uno **screenshot di appunti scritti a mano**, trascrivi il contenuto
in codice LaTeX pronto da incollare nel capitolo corrente.

La trascrizione **non deve essere letterale**: lo scopo è ottenere un testo che
abbia senso compiuto e si legga bene, non una copia fedele dell'originale.
Pertanto:

- espandi le frasi telegrafiche degli appunti in prosa fluente;
- **riscrivi liberamente le frasi** quando la forma originale è frammentaria,
  ambigua o suona male — privilegia chiarezza e scorrevolezza rispetto alla
  fedeltà letterale;
- aggiungi brevi frasi di raccordo dove necessario;
- esplicita un po' di più i passaggi fisici o matematici;
- mantieni comunque il contenuto e la sostanza fedeli agli appunti: non
  introdurre concetti che non ci sono e non distorcere quelli presenti.

### Controllo anti-ripetizione (obbligatorio)

**Prima di trascrivere una nuova immagine**, leggi le ultime righe del file
del capitolo corrente (tipicamente le ultime ~40–80 righe, quanto basta per
inquadrare il discorso in corso). Confronta il contenuto dello screenshot con
quanto già scritto e:

- se l'immagine riprende concetti già presenti nelle ultime righe, **non
  ripeterli**: parti direttamente dal primo concetto nuovo;
- se serve, **modifica le ultime righe già scritte** per raccordare meglio
  il testo precedente con il nuovo materiale (è consentito, vedi
  ``Struttura'' sotto);
- evita in particolare di reintrodurre definizioni, figure o passaggi
  appena trattati anche se compaiono nell'immagine.

Rispondi **solo** con il blocco di codice LaTeX. Nessuna spiegazione, nessun testo
prima o dopo.

---

## Regole di trascrizione

### Struttura
- **Non aggiungere mai** `\section`, `\subsection`, `\chapter` — ci pensa l'utente.
- Evita `\subsubsection`: aggiungilo solo se introduce un blocco logicamente
  distinto e sostanzioso. In dubbio, non metterlo.
- **Non aggiungere mai** `\begin{document}`, `\end{document}` o il preambolo.
- Non riproporre codice di interazioni precedenti nella stessa sessione.
- È però consentito modificare le ultime righe del codice già scritto per raccordare
  meglio la fine del testo precedente con il nuovo contenuto trascritto.

### Matematica
- Matematica **inline**: usa `\( ... \)` — mai `$ ... $`.
- Matematica **in display**: usa sempre `\begin{equation} ... \end{equation}`.
  Per equazioni multiple allineate: `\begin{align} ... \end{align}`.
- Sistemi di equazioni: `\begin{equation} \begin{cases} ... \end{cases} \end{equation}`.
- Usa `\ell` per il numero quantico orbitale, **mai** la lettera `l`.
- Usa i comandi del pacchetto `physics` già caricato nel preambolo:
  `\pdv{}`, `\dv{}`, `\nabla`, `\grad`, `\mel{}{}{}`, `\bra{}`, `\ket{}`,
  `\braket{}`, `\expval{}`, `\abs{}`, `\norm{}`.
- Usa `\vec{}` per i vettori (es. `\vec{r}`, `\vec{p}`).
- Usa `\hbar`, `\epsilon_0`, `\mu_0`, `\infty` — mai le versioni testuali.
- Per l'identità usa il comando personalizzato `\id` (definito nel preambolo).
- Per il prodotto interno usa `\ip{a}{b}` (definito nel preambolo come `\langle a, b \rangle`).

### Ambienti teoremici (definiti in preamble.tex)
Usa **esclusivamente** questi ambienti — non inventarne di nuovi:

```latex
\begin{theorem} ... \end{theorem}
\begin{lemma} ... \end{lemma}
\begin{definition} ... \end{definition}
\begin{example} ... \end{example}
\begin{exercise} ... \end{exercise}
\begin{remark} ... \end{remark}
\begin{solution} ... \end{solution}
\begin{attention} ... \end{attention}

% Nota con titolo e label (ambiente tcolorbox):
\begin{note}{Titolo della nota}{label}
  ...
\end{note}
```

### Equazioni importanti da evidenziare
Per boxare un'equazione importante usa `importantbox`:
```latex
\begin{importantbox}
  \begin{equation}
    ...
  \end{equation}
\end{importantbox}
```

Oppure la sintassi inline con tcolorbox (come nei capitoli esistenti):
```latex
\begin{tcolorbox}[colback=blue!5, colframe=blue!50, sharp corners, boxrule=0.5pt]
  \begin{equation}
    ...
  \end{equation}
\end{tcolorbox}
```

### Testo
- Usa `\textbf{}` per il grassetto, `\textit{}` per il corsivo.
- Usa `\emph{}` per enfasi semantica.
- Per "Effetto Stark", "Effetto Zeeman" e simili: nome proprio in testo normale,
  non in corsivo.
- Usa `\divisionsymbol` per il simbolo ÷ (es. intervalli di valori).
- Elenchi puntati: `\begin{itemize} \item ... \end{itemize}`.
- Elenchi numerati: `\begin{enumerate} \item ... \end{enumerate}`.

### Marcatori di lezione
Se lo screenshot indica l'inizio di una nuova lezione, inserisci:
```latex
\lezione{N}{GG/MM/AAAA}
```
subito dopo l'intestazione della sezione corrispondente.

### Figure con TikZ
Ogni diagramma TikZ va sempre dentro un ambiente `figure`:
```latex
\begin{figure}[htbp]
    \centering
    \begin{tikzpicture}[>=stealth, scale=1.2]
        % ...
    \end{tikzpicture}
    \caption{Descrizione della figura.}
    \label{fig:label_descrittivo}
\end{figure}
```
- Stile coerente con i capitoli esistenti: `[>=stealth]`, frecce `\draw[->, thick]`,
  colori `blue!80!black` e `red!80!black` per vettori fisici.
- Usa `\coordinate` per i punti nominati.
- **Caption descrittive ma essenziali**: la `\caption{}` deve descrivere il soggetto
  della figura — può anche essere più di una frase se serve a identificarlo — ma
  non deve contenere la spiegazione fisica dei concetti rappresentati. Niente
  ripetizioni di passaggi già nel testo, niente riferimenti a colori, niente
  illustrazione del significato: la spiegazione sta nella prosa, la caption descrive
  solo cosa è raffigurato.

### Figure esterne (PNG)
```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.7\textwidth]{nome_file}
    \caption{Descrizione.}
    \label{fig:label}
\end{figure}
```
Le immagini stanno in `figures/` — scrivi solo il nome senza percorso né estensione.

### Ambiguità e incertezze
Se una parola o formula è illeggibile o ambigua, ignorala e vai avanti senza lasciare
commenti nel codice. Non usare mai `% [INCERTO: ...]`.

---

## Stile testuale da replicare

Osserva i capitoli esistenti e rispetta queste convenzioni:

- Il testo introduttivo di ogni argomento è in prosa, non in elenco.
- Le variabili fisiche vengono definite con elenchi `itemize` dopo l'equazione
  (es. "Dove: \item \( x \) rappresenta ...").
- Le Hamiltoniane si scrivono con `H^{(0)}` per l'imperturbata,
  `\Delta H_{...}` per le perturbazioni.
- Le funzioni d'onda: `\Psi` per la totale, `\psi` per la spaziale, `\chi` per lo spin.
- I ket degli stati: `\ket{n, \ell, m_\ell, m_s}`.
- Le correzioni energetiche: `E^{(0)}`, `E^{(1)}`, `\Delta E_{...}`.

---

## Cosa NON fare

- Non usare `$$...$$` o `$...$` per la matematica.
- Non usare `\section{}` o titoli di qualsiasi livello.
- Non aggiungere testo esplicativo fuori dal blocco di codice.
- Non usare ambienti non definiti in `preamble.tex`.
- Non modificare file diversi da quello del capitolo corrente.
- Non riformattare codice già scritto nelle sessioni precedenti.
