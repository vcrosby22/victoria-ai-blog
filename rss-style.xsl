<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="/rss/channel/title"/> — RSS Feed</title>
        <link rel="preconnect" href="https://fonts.googleapis.com"/>
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin=""/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap" rel="stylesheet"/>
        <style>
          :root {
            --bg: #fafafa;
            --surface: #ffffff;
            --text: #1a1a2e;
            --muted: #64748b;
            --accent: #6366f1;
            --border: #e2e8f0;
          }
          @media (prefers-color-scheme: dark) {
            :root {
              --bg: #0f172a;
              --surface: #1e293b;
              --text: #e2e8f0;
              --muted: #94a3b8;
              --accent: #818cf8;
              --border: #334155;
            }
          }
          * { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            font-family: "Inter", system-ui, sans-serif;
            background: var(--bg);
            color: var(--text);
            line-height: 1.7;
            padding: 2rem 1.5rem;
          }
          .feed {
            max-width: 680px;
            margin: 0 auto;
          }
          .feed-header {
            margin-bottom: 2rem;
            padding-bottom: 1.5rem;
            border-bottom: 1px solid var(--border);
          }
          .feed-badge {
            display: inline-block;
            background: var(--accent);
            color: white;
            font-size: 0.75rem;
            font-weight: 600;
            padding: 0.2em 0.6em;
            border-radius: 4px;
            margin-bottom: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 0.05em;
          }
          h1 { font-size: 1.75rem; margin-bottom: 0.5rem; }
          .feed-desc { color: var(--muted); font-size: 0.95rem; }
          .feed-hint {
            margin-top: 0.75rem;
            font-size: 0.825rem;
            color: var(--muted);
            background: var(--surface);
            border: 1px solid var(--border);
            border-radius: 6px;
            padding: 0.6rem 0.85rem;
          }
          .feed-hint code {
            font-size: 0.8rem;
            background: var(--bg);
            padding: 0.1em 0.35em;
            border-radius: 3px;
          }
          .item {
            padding: 1.25rem 0;
            border-bottom: 1px solid var(--border);
          }
          .item:last-child { border-bottom: none; }
          .item-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.25rem;
          }
          .item-title a {
            color: var(--text);
            text-decoration: none;
          }
          .item-title a:hover { color: var(--accent); }
          .item-meta {
            font-size: 0.8rem;
            color: var(--muted);
            margin-bottom: 0.4rem;
          }
          .item-desc {
            font-size: 0.9rem;
            color: var(--muted);
            line-height: 1.55;
          }
        </style>
      </head>
      <body>
        <div class="feed">
          <div class="feed-header">
            <span class="feed-badge">RSS Feed</span>
            <h1><xsl:value-of select="/rss/channel/title"/></h1>
            <p class="feed-desc"><xsl:value-of select="/rss/channel/description"/></p>
            <p class="feed-hint">
              This is an RSS feed. Copy the URL and paste it into your feed reader
              (Feedly, NetNewsWire, Inoreader, etc.) to subscribe.
            </p>
          </div>
          <xsl:for-each select="/rss/channel/item">
            <div class="item">
              <h2 class="item-title">
                <a>
                  <xsl:attribute name="href"><xsl:value-of select="link"/></xsl:attribute>
                  <xsl:value-of select="title"/>
                </a>
              </h2>
              <p class="item-meta"><xsl:value-of select="pubDate"/></p>
              <p class="item-desc"><xsl:value-of select="description"/></p>
            </div>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
