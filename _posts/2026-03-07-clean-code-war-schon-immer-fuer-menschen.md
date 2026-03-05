---
layout: post
title: "Clean Code war schon immer für Menschen"
date: 2026-03-07 12:00:00 +0100
categories: [ai, entwicklung, software-engineering]
tags: [clean-code, ki-entwicklung, vibe-coding, software-qualität, zukunft-der-entwicklung]
author: Metin Özkan
description: "Jeder Style Guide, jede Namenskonvention, jedes Architekturprinzip existiert aus demselben Grund: Menschen müssen den Code lesen. Diese Annahme beginnt zu bröckeln."
lang: de
ref: clean-code-for-humans
permalink: /de/blog/2026/03/07/clean-code-war-schon-immer-fuer-menschen/
---

Jede Regel in deinem Style Guide existiert, weil ein Mensch das Ergebnis lesen muss.

SOLID, DRY, aussagekräftige Variablennamen, kurze Funktionen, einheitliche Formatierung — nichts davon lässt Software schneller laufen oder korrekter verhalten. Es macht Software für Menschen leichter verständlich, anpassbar und vertrauenswürdig. Das ist der einzige Zweck. Der Maschine ist es egal.

Wenn Maschinen Code schreiben — und das tun sie zunehmend — beginnt die Rechtfertigung für diese Konventionen zu bröckeln.

## Die menschliche Annahme hinter jedem Prinzip

Nimm ein beliebiges Prinzip des Software Craftsmanship und verfolge es bis zu seiner Wurzel.

**Lesbare Variablennamen.** Eine Funktion namens `berechneRechnungsSumme` sagt dem nächsten Entwickler, was sie tut. Eine Funktion namens `fn_a7` nicht. Maschinen führen beide identisch aus.

**Kurze Funktionen.** Die Regel, dass eine Funktion eine Aufgabe erledigen und auf einen Bildschirm passen soll, ist eine menschliche Gedächtnis- und Aufmerksamkeitsbeschränkung. Kontextfenster funktionieren nicht so.

**DRY — Don't Repeat Yourself.** Duplikation ist gefährlich, weil ein Mensch, der einen Fehler findet, nur eine Kopie korrigiert und die andere übersieht. Ein Modell, das die gesamte Codebase gleichzeitig scannen kann, hat dieses Risiko nicht.

**Architekturmuster.** Schichtenarchitektur, Ports and Adapters, hexagonales Design — diese existieren, um die kognitive Last in Teams zu managen. Eine klare Grenze hilft einem Entwickler, ein System zu verstehen, ohne es vollständig zu überblicken.

Jedes Prinzip löst ein menschliches Problem. Code ist lesbar, weil Menschen damit arbeiten müssen. Streicht man die Menschen heraus, verschiebt sich das gesamte Fundament.

## Drei Konsequenzen

Wenn Code aufhört, primär für menschliche Leser da zu sein, folgen drei Dinge — nicht gleichzeitig, nicht vollständig, aber in der Tendenz.

**Wegwerfcode wird normal.** Heute refaktorisieren, pflegen und erweitern Entwickler Code, weil Neuschreiben teuer ist. Wenn Generierung günstig ist, ändert sich die Kosten­rechnung. Wegwerfen. Neu generieren. Kein Patch, keine Migration, kein Legacy.

**Maschinenoptimierte Repräsentationen ersetzen den Quelltext.** Das passiert bereits in eingeschränkten Bereichen. LLVM IR, WebAssembly, kompilierte neuronale Netzgraphen — diese werden nicht von Menschen geschrieben und sind nicht für Menschen gedacht. Wenn KI sowohl Generierung als auch Optimierung übernimmt, warum dann noch den Umweg über ein menschenlesbares Zwischenformat?

**Spezifikationen werden zum eigentlichen Quelltext.** Wenn eine Maschine die Implementierung generiert, verwalten Menschen nur noch die Absicht: Was das System tun muss, wie es unter Fehlern reagieren muss, was seine Ausgaben garantieren müssen. Die Spezifikation wird zum Artefakt. Der Code darunter ist ein Implementierungsdetail.

## Was sich nicht ändert

Verantwortlichkeit löst sich nicht auf, weil der Code maschinell generiert wurde.

Software trifft Entscheidungen — über Geld, Zugänge, Sicherheit, Privatsphäre. Diese Entscheidungen müssen auditierbar sein. Eine Aufsichtsbehörde, die fragt, wie ein System zu einem Ergebnis gelangt ist, akzeptiert "das Modell hat es generiert" nicht als Antwort. Jemand muss das Verhalten verantworten.

Sicherheit verbessert sich nicht in opaken Systemen. Opaker Code ist nicht von Natur aus sicherer. Er ist schwerer zu prüfen, schwerer an Grenzen zu testen und schwerer zu zertifizieren. Die Angriffsfläche schrumpft nicht, weil der Quelltext unlesbar ist.

Es gibt noch einen subtileren Punkt. Selbst KI-Systeme brauchen eine Repräsentation des Codes, um darüber zu urteilen. Ob diese Repräsentation menschenlesbar sein muss, ist eine offene Frage. Dass sie existieren muss — strukturiert, präzise und eindeutig — ist es nicht.

## Wohin Clean Code geht

Clean Code stirbt nicht. Er wird neu verhandelt.

Für menschlich gewartete Codebasen — was noch immer auf fast alles zutrifft, das heute in Produktion geht — gelten die Prinzipien weiterhin. Die Gründe haben sich nicht geändert.

Aber die Richtung ist erkennbar. Wenn Generierungskosten sinken und KI mehr der Implementierungsschicht übernimmt, verlieren Konventionen, die ausschließlich der menschlichen Lesbarkeit dienen, an Gewicht. Nicht weil sie falsch sind, sondern weil das Publikum, für das sie erfunden wurden, nicht mehr der primäre Leser ist.

Entwickler, die verstehen, *warum* ein Prinzip existiert — nicht nur *dass* es existiert — werden diesen Wandel navigieren, ohne den Boden zu verlieren. Wer Style Guides als Dogma behandelt, ohne die Begründung dahinter zu kennen, wird merken, dass sich der Boden verschiebt.

Der Code war schon immer für die Menschen.  
Wenn die Menschen nicht mehr die Leser sind, ändert sich der Code.  
Was bleibt, ist die Absicht, die Verantwortung und das Urteilsvermögen, den Unterschied zu kennen.
