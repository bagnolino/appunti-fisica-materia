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

---

## Compito principale

Quando ricevi uno **screenshot di appunti scritti a mano**, trascrivi il contenuto
in codice LaTeX pronto da incollare nel capitolo corrente.

Rispondi **solo** con il blocco di codice LaTeX. Nessuna spiegazione, nessun testo
prima o dopo, salvo i commenti `%` dentro il codice quando necessario.

---

## Regole di trascrizione

### Struttura
- **Non aggiungere mai** `\section`, `\subsection`, `\subsubsection`, `\chapter` —
  ci pensa l'utente.
- **Non aggiungere mai** `\begin{document}`, `\end{document}` o il preambolo.
- Non riproporre codice di interazioni precedenti nella stessa sessione.

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
Se una parola o formula negli appunti è illeggibile o ambigua:
```latex
% [INCERTO: trascrizione incerta di "..."]
```

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
