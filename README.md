# Cg Shaders in Unity

A collection of Shaders written in **Cg** for the **Built-in RP** in Unity, from basic to advanced.

### References

- [Learn Unity Shaders from Scratch by Nik Lever](https://www.udemy.com/course/learn-unity-shaders-from-scratch)

## Features

- [Simple 2D Texture](#simple-2d-texture)
  - [Flip Texture](#flip-texture)
  - [Grayscale](#grayscale)
  - [Rotate Texture](#rotate-texture)

---

## Simple 2D Texture

1. Expose a ShaderLab property to take in a `2D` texture.
1. Connect the property to the Cg program, using a `sampler2D` variable.
1. Use the [tex2D](https://developer.download.nvidia.com/cg/tex2D.html) function from cg to map a pixel from the texture, to a pixel of the fragment, using the uv coordinates.

```c
_MainTexture("Main Texture", 2D) = "white" {}
```

```c
fixed3 color = tex2D(_MainTexture, uv).rgb;
```

![Gif](./docs/1.gif)

### Flip Texture

1. Subtract the uvs to make them flip along x or y.

```c
float2 uv = float2(
    _FlipHorizontal ? 1 - i.uv.x : i.uv.x,
    _FlipVertical ? 1 - i.uv.y : i.uv.y
);
```

![Gif](./docs/1b.gif)

### Grayscale

1. Use just a channel for all colors (not ideal).

```c
fixed3 color = _Grayscale ? texColor.rrr : texColor.rgb;
```

![Gif](./docs/1c.gif)

### Rotate Texture

1. Use a rotation matrix to rotate the uvs along a specified center.

```c
float2x2 rotation = getRotationMatrix2D(UNITY_PI * _RotationAngle);
uv = mul(uv - _RotationCenter.xy, rotation) + _RotationCenter.xy;
```

![Gif](./docs/1d.gif)
