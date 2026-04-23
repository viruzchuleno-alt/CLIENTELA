# Design System — Creación & Diseño

## Concepto Visual
Estética **dark tech-luxe**: fondo negro profundo con acentos en violeta/púrpura vibrante. El diseño comunica profesionalismo digital, modernidad y confianza. Inspirado en interfaces de agencias de diseño de alto nivel.

---

## Paleta de Colores

| Token | Valor | Uso |
|-------|-------|-----|
| `--color-bg` | `#050505` | Fondo principal |
| `--color-surface` | `#0f0f0f` | Tarjetas / secciones elevadas |
| `--color-surface-2` | `#1a1a2e` | Cards con tinte azul oscuro |
| `--color-accent` | `#7c3aed` | Violeta primario (botones, highlights) |
| `--color-accent-light` | `#a855f7` | Violeta claro (texto destacado, hovers) |
| `--color-accent-glow` | `rgba(124,58,237,0.3)` | Glow y sombras de acento |
| `--color-text-primary` | `#ffffff` | Títulos principales |
| `--color-text-secondary` | `#a1a1aa` | Párrafos y descripciones |
| `--color-text-muted` | `#52525b` | Labels, texto terciario |
| `--color-border` | `rgba(255,255,255,0.08)` | Bordes sutiles |

---

## Tipografía

```css
/* Display / Títulos grandes */
font-family: 'Syne', sans-serif;
font-weight: 800;

/* Body / Texto corrido */
font-family: 'DM Sans', sans-serif;
font-weight: 400 | 500;

/* Fuentes vía Google Fonts */
@import url('https://fonts.googleapis.com/css2?family=Syne:wght@700;800&family=DM+Sans:wght@400;500;600&display=swap');
```

### Escala tipográfica

| Elemento | Tamaño | Peso | Familia |
|----------|--------|------|---------|
| Hero title | `clamp(3rem, 8vw, 6rem)` | 800 | Syne |
| H2 section | `clamp(2rem, 4vw, 3rem)` | 700 | Syne |
| Stat number | `clamp(4rem, 10vw, 8rem)` | 800 | Syne |
| Body text | `1rem` / `1.125rem` | 400 | DM Sans |
| Label / caption | `0.75rem` – `0.875rem` | 500 | DM Sans |

---

## Espaciado

Sistema de 8pt:

| Token | Valor |
|-------|-------|
| `--space-xs` | `8px` |
| `--space-sm` | `16px` |
| `--space-md` | `24px` |
| `--space-lg` | `48px` |
| `--space-xl` | `80px` |
| `--space-2xl` | `120px` |

---

## Componentes

### Botón primario (CTA)
- Background: `--color-accent`
- Border-radius: `999px` (pill)
- Padding: `12px 28px`
- Texto: mayúsculas, `0.85rem`, `letter-spacing: 0.1em`
- Hover: `--color-accent-light` + `box-shadow` con glow violeta

### Botón secundario (outline)
- Border: `1px solid rgba(255,255,255,0.2)`
- Background: transparente
- Hover: background `rgba(255,255,255,0.05)`

### Cards de proceso (Flujo de trabajo)
- Background: gradiente de `#1a1a2e` a `#0d0d1a`
- Border: `1px solid rgba(124,58,237,0.2)`
- Border-radius: `16px`
- Botón `+` en esquina superior derecha: círculo `28px`, color acento
- Estado expandido: muestra descripción con animación `max-height` + `opacity`

### Badge / Step number
- Posición absoluta top-right en sección
- Fuente Syne 800, color `rgba(255,255,255,0.06)` (watermark sutil)
- Tamaño `5rem` – `6rem`

---

## Íconos
- Globe icon: SVG inline, stroke blanco, `stroke-width: 1.5`
- Círculos decorativos: SVG con `fill: none`, `stroke: var(--color-accent)`

---

## Animaciones

| Nombre | Descripción |
|--------|-------------|
| `fadeInUp` | Entrada suave desde abajo (20px), opacity 0→1, `0.6s ease` |
| Card expand | `max-height: 0 → 500px`, `0.4s ease` al click en `+` |
| Glow pulse | `box-shadow` animado en el CTA principal, `2s infinite` |
| Hover lift | `translateY(-4px)` en cards, `0.25s ease` |

---

## Layout

- **Max-width:** `1200px`, centrado con `margin: 0 auto`
- **Padding lateral:** `clamp(24px, 5vw, 80px)`
- **Grid hero:** flex column centrado
- **Grid "Nuestro trabajo":** 2 columnas (texto izquierda, copy derecha)
- **Grid flujo de trabajo:** 3 cards + flecha + resultado (flex row, gap `16px`)
- **Responsive breakpoint:** `768px` → stack a columna única

---

## Estructura de Secciones

```
1. HERO          → Logo globe, título, botón "Saber más"
2. NUESTRO TRABAJO → Título izquierda, descripción derecha + imagen full-width
3. STAT          → "75%" + texto credibilidad
4. PROCESO 1.1   → Título "¿Cómo funciona?", cards colapsadas (solo título)
5. PROCESO 1.2   → Mismo layout, cards expandidas (con descripción visible)
   → En la web es UNA sola sección: el click en "+" expande el card
6. CTA FINAL     → "Trabaja con los mejores", botón agendar reunión
```

---

## Notas de implementación

- Las secciones 1.1 y 1.2 del diseño son **la misma sección** con estado colapsado/expandido. Usar JavaScript para toggle de clase `is-expanded` en cada card.
- El ícono `+` rota a `×` cuando el card está expandido (`transform: rotate(45deg)`).
- Usar `scroll-behavior: smooth` para el botón "Saber más".
- Imagen de laptop con luz violeta: usar `object-fit: cover`, border-radius `16px`.
