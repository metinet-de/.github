---
layout: post
title: "Shadow Code: Der KI-Output, den niemand prüft"
date: 2026-03-09
categories: [ki, software-engineering, code-qualitaet]
lang: de
ref: shadow-code-ai-output
permalink: /de/blog/2026/03/09/shadow-code-der-ki-output-den-niemand-prueft/
tags: [ki, software-engineering, code-qualitaet, sicherheit]
description: "Shadow Code entsteht, wenn Teams KI-generierten Output shippen, den niemand wirklich gelesen, verstanden oder verantwortet hat."
---

Du lieferst Features schneller als je zuvor. Du weißt auch nicht mehr genau, was die Hälfte davon wirklich tut.

Das ist das Shadow-Code-Problem. Es ist kein theoretisches Risiko — es passiert bereits in deiner Codebasis.

## Das Code-Delirium

KI-Coding-Assistenten sind genuinen Nutzen. Ein gut formulierter Prompt produziert in Sekunden funktionierenden, strukturierten Code. Für viele Entwickler fühlt sich das wie ein Superkraft an. Es ist auch eine Falle.

Die Falle hat einen Namen: **Code-Delirium**. Feature nach Feature, Sprint nach Sprint — die Geschwindigkeit fühlt sich unwiderstehlich an. Du beendest einen Prompt und fängst sofort mit dem nächsten an. Das Modell liefert Output. Du reviewst — kurz, weil der Output vernünftig aussieht. Du committest.

Wiederholen.

Der Kompoundierungseffekt ist unsichtbar, bis er es nicht mehr ist. Irgendwann merkst du, dass du ein Produktionssystem hast, das niemand mehr wirklich versteht.

## Was Shadow Code ist

**Shadow Code** ist nicht einfach technische Schulden. Technische Schulden sind Code, den du bewusst unvollkommen geschrieben hast. Shadow Code ist Code, den niemand bewusst so entschieden hat.

Er lebt in den Lücken zwischen deinen Prompts. Er ist die Helper-Funktion, die das Modell "der Vollständigkeit halber" hinzugefügt hat. Die Abstraktionsschicht, die fünf Edge Cases abdeckt, die deine Anwendung nie antreffen wird. Das Error-Handling-Pattern, das mit dem Pattern zwei Module weiter kollidiert — weil das Modell davon nichts wusste.

Niemand hat es wirklich gereviewed. Du hast es überflogen. Du hast die Tests laufen lassen. Du hast es deployed.

## Warum das gefährlich ist

Die Probleme sind nicht abstrakt.

**Unnötiger Code.** Modelle generieren vollständige Lösungen. Vollständig bedeutet verallgemeinert. Verallgemeinert bedeutet aufgebläht für deinen konkreten Kontext. Deine Anwendung wird mit jedem KI-generierten Feature schwerer, langsamer und schwerer zu durchdenken.

**Sicherheitslücken.** Ungeprüfte Authentifizierungs-Logik, Datenbankabfragen und API-Endpoints sind eine Angriffsfläche. Die [OWASP Top 10](https://owasp.org/www-project-top-10/) Schwachstellen — SQL-Injection, Broken Access Control, unsichere Deserialisierung — kümmert es nicht, wie schnell du geliefert hast. Sie schleichen sich leise ein, besonders wenn niemand das vollständige Diff liest.

**Architekturelle Entfremdung.** Das ist die am meisten unterschätzte Konsequenz. Je länger du dem Modell erlaubst, architektonische Entscheidungen unangefochten zu treffen, desto fremder wird dein eigenes System. Lösungswege werden akzeptiert, nicht verstanden. Das mentale Modell deiner Codebasis verblasst. Du wirst zum Prompt-Engineer, der eine Codebasis verwaltet, die ihm nicht mehr gehört.

## Frameworks helfen — aber nicht genug

In der Verwendung etablierter Frameworks steckt echter Schutz. Modelle, die auf großen öffentlichen Codebasen trainiert wurden, haben Rails, Django, Spring und NestJS tausende Male gesehen. Wenn du innerhalb eines bekannten Frameworks arbeitest und dem Modell diese Struktur mitgibst, folgt es in der Regel etablierten Patterns — inklusive der Best Practices, die in diesem Ökosystem verankert sind.

Das ist real, und es ist nicht nichts.

Aber es löst das grundsätzliche Problem nicht. Frameworks bieten strukturelle Leitplanken. Sie verhindern keine unnötigen Abstraktionen. Sie erkennen nicht die subtile Sicherheitslücke im Authentifizierungs-Flow. Sie halten dich nicht davon ab, die Kontrolle über deine eigene Software zu verlieren.

## Was du dagegen tun kannst

Die Antwort ist nicht, KI-Assistenten nicht mehr zu verwenden. Das ist nicht realistisch und wäre auch dann nicht die richtige Entscheidung.

Die Antwort ist, den Review-Prozess bewusst und strukturell wieder einzubauen.

**Instruction-Dateien.** GitHub Copilot unterstützt `.github/copilot-instructions.md`. Nutze es. Definiere, welche Patterns erlaubt sind, welche verboten sind, wie Fehler behandelt werden sollen, welche Schichten das Modell anfassen darf. Andere Tools, darunter Claude Projects, unterstützen äquivalente Instruktionen auf Systemebene. Schreib sie. Sei konkret.

**Automatisierte Pre-Commit Security-Checks.** Erstelle einen Sub-Agenten oder Pre-Commit-Hook, der vor jedem Commit einen OWASP-Top-10-Check durchführt. Das muss nicht manuell sein. Ein anderes Modell kann das übernehmen. Entscheidend ist, dass es verpflichtend ist und jedes Mal passiert — nicht nur wenn du daran denkst.

**Review deine eigenen Guardrails.** Hier versagen die meisten Teams. Die Instruction-Dateien und Sub-Agenten-Prompts sind oft selbst KI-generiert. Das ist in Ordnung. Aber sie sind auch Code — sie können driften, veralten oder nie wirklich das abbilden, was du dir vorgestellt hast. Review sie regelmäßig. Behandle sie wie jede andere kritische Konfiguration.

## Die Ownership-Frage

Geschwindigkeit ohne Ownership ist keine Produktivität. Es ist Delegation ohne Verantwortung.

Das Modell besitzt deine Codebasis nicht. Du tust es. Jede Zeile, die deployed wird, gehört dir — unabhängig davon, wer sie generiert hat. Das ist keine moralische Position; es ist eine praktische. Wenn der Produktions-Incident um 2 Uhr nachts passiert, hat das Modell keinen Bereitschaftsdienst.

Lies das Diff.

Verstehe, was du deployst.

Setze die Guardrails — und dann überprüfe die Guardrails.

Stillstand ist keine Option. Aber Code zu shippen, den du nicht verstehst, ist kein Fortschritt. Es ist eine andere Form von Stillstand.
