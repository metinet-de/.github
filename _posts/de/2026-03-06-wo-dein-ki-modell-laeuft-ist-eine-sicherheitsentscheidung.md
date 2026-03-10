---
layout: post
title: "Wo dein KI-Modell läuft, ist eine Sicherheitsentscheidung"
date: 2026-03-06 14:00:00 +0100
categories: [ai, sicherheit, infrastruktur]
tags: [self-hosted-ai, datenschutz, datensicherheit, llm, ki-infrastruktur]
author: Metin Özkan
description: "Je näher ein KI-Modell an deinen Daten läuft, desto privater und teurer wird es. Dieser Zielkonflikt verschwindet nicht — aber er lässt sich steuern."
lang: de
ref: self-hosted-ai-privacy-tradeoff
permalink: /de/blog/2026/03/06/wo-dein-ki-modell-laeuft-ist-eine-sicherheitsentscheidung/
---

Je näher ein KI-Modell an deinen Daten läuft, desto aufwändiger und teurer wird der Betrieb. Diese Beziehung ist kein Zufall. Sie ist die Form jedes Datenschutz-Zielkonflikts in der KI-Infrastruktur.

Lokal bedeutet privat. Cloud bedeutet komfortabel. Zu wissen, was die eigene Situation erfordert, ist die einzige Entscheidung, die zählt.

## Die Kosten des Lokalen

Ein leistungsfähiges Sprachmodell lokal zu betreiben ist nicht wie einen Webserver zu betreiben. Ein Webserver hat vorhersehbare Ressourcenanforderungen und Jahrzehnte ausgereifter Betriebswerkzeuge hinter sich. Ein lokales LLM braucht RAM — sehr viel davon — und das Tooling für Verwaltung, Updates und Serving ist noch nicht ausgereift.

Die RAM-Preise haben das Problem verschärft. Die Nachfrage nach KI-Infrastruktur hat die Speicherkosten erheblich in die Höhe getrieben. Was vor zwei Jahren eine überschaubare Serverinvestition gewesen wäre, ist heute eine ernsthafte Kapitalverpflichtung. Das ist keine vorübergehende Marktbewegung. Es spiegelt eine strukturelle Verschiebung in der globalen Hardware-Nachfrage wider.

Jenseits der Kosten erfordert lokaler KI-Betrieb eine andere Art von Expertise. Quantisierung, Kontextfensterverwaltung, Modellauswahl, Inferenzoptimierung — nichts davon lässt sich auf bestehendes Web-Operations-Wissen übertragen. Teams, die Produktionsinfrastruktur routiniert betreiben, stehen beim lokalen LLM-Hosting oft vor einem völlig anderen Problemfeld.

## Die Lücke in der Mitte

Die leistungsstärksten amerikanischen Modelle — Claude, GPT-Klasse-Systeme — lassen sich nicht lokal betreiben. Ihre Parameteranzahl und Architekturanforderungen verorten sie fest im Rechenzentrum. Wer ihre Leistungsfähigkeit will, nutzt ihre API. Das bedeutet: Daten verlassen die eigene Infrastruktur.

Das ist kein Fehler der Modelle, eher eine Konsequenz dessen, was sie sind.

Zwischenlösungen existieren und sind das Verstehen wert. Cloud-Anbieter wie AWS betreiben Instanzen ausgewählter Modelle in dedizierten EU-Regionen — Inferenz und Daten verlassen dabei das EU-Gebiet nicht. Diese regionale Datenhaltung ist etwas grundlegend anderes als Daten an eine globale Consumer-API zu senden. Es ist nicht dasselbe wie lokal — aber es bietet Datenschutzgarantien, die ein unkontrolliertes SaaS-Modell nicht geben kann.

Proxy-Architekturen, Enterprise-Verträge und regionale Cloud-Deployments liegen auf dem Spektrum zwischen vollständig lokal und vollständig öffentlich. Das sind keine Kompromisse, für die man sich schämen müsste. Es sind die realistischen Optionen, die jetzt verfügbar sind.

## Hardware wird besser werden

Die aktuelle Einschränkung drüfte nicht dauerhaft sein. Modelle werden effizienter. Quantisierungstechniken ermöglichen, größere Modelle mit kleinerem Speicherbedarf zu betreiben. Consumer- und Workstation-Hardware verbessert sich. Was heute einen dedizierten Server erfordert, könnte in zwei oder drei Jahren ausreichend auf einem Entwicklerrechner laufen.

Das ist für die Planung relevant. Organisationen, die heute in KI-Infrastruktur investieren, sollten auf Flexibilität setzen. Die Grenze zwischen "erfordert Cloud" und "kann lokal laufen" wird sich verschieben.

## Die Entscheidung, die tatsächlich getroffen werden muss

Bevor gefragt wird, wo ein Modell laufen soll, muss gefragt werden, welche Daten das Modell berühren wird.

Das ist der Klassifizierungsschritt, der alles andere bestimmt.

**Hochsensible Daten** — proprietärer Quelltext, personenbezogene Gesundheits- oder Finanzdaten, interne Strategiedokumente — sollten ausschließlich Modelle berühren, die innerhalb der eigenen Infrastruktur laufen. Wenn das derzeit nicht umsetzbar ist, ist die Antwort nicht, eine öffentliche API zu verwenden. Die Antwort ist: diesen Anwendungsfall vorerst nicht mit einem LLM bearbeiten.

**Niedrigsensible oder öffentliche Daten** — Dokumentation, öffentlich verfügbare Informationen, Marketing-Texte, Open-Source-Code — können ohne nennenswerte Risiken über SaaS-LLM-APIs fließen. OpenAI, Anthropic und ähnliche Anbieter sind für diese Stufe geeignet.

**Alles dazwischen** erfordert eine explizite Bewertung. Daten klassifizieren. Datenschutzhandhabung des Modells verstehen. Eine dokumentierte Entscheidung treffen.

Das ist keine einmalige Übung. Neue Modelle, neue Anwendungsfälle und neue Datentypen werden entstehen. Die Klassifizierung muss ein Prozess sein, keine Tabellenkalkulation, die jemand einmal befüllt hat.

So gilt:
- Evaluiere deine Daten, bevor du deine Modelle evaluierst.  
- Passe das Hosting an die Sensibilität an, nicht an den Komfort.  
- Die Modelle werden besser und günstiger. Die Daten werden nicht von alleine weniger sensibel.
